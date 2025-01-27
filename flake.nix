{
  description = "CH32 related packages";
  inputs = {
    devenv-root = {
      url = "file+file:///dev/null";
      flake = false;
    };
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    devenv-root,
    devenv,
    flake-parts,
    nixpkgs,
    systems,
    treefmt-nix,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;

      imports = [
        devenv.flakeModule
        treefmt-nix.flakeModule
      ];

      perSystem = {
        self',
        config,
        pkgs,
        system,
        ...
      }: {
        devenv.shells.default = {pkgs, ...}: {
          devenv.root = let
            devenvRootFileContent = builtins.readFile devenv-root.outPath;
          in
            pkgs.lib.mkIf (devenvRootFileContent != "") devenvRootFileContent;

          # https://github.com/cachix/devenv/issues/528
          containers = pkgs.lib.mkForce {};

          programs.treefmt.package = config.treefmt.build.wrapper;

          imports = [./devenv.nix];

          packages = (with pkgs; [
            cmake
            ninja
          ]) ++ (with self'.packages; [
            mrs-openocd
            mrs-riscv-embedded-gcc
            mrs-riscv-embedded-gcc12
            wchisp
            wlink
          ]);
        };

        packages = let
          mrs-toolchain = pkgs.callPackage ./nix/mrs-toolchain {};
        in {
          mrs-openocd = mrs-toolchain.openocd;
          mrs-riscv-embedded-gcc  = mrs-toolchain.riscv-embedded-gcc;
          mrs-riscv-embedded-gcc12  = mrs-toolchain.riscv-embedded-gcc12;
          wch-udev-rules = pkgs.callPackage ./nix/wch-udev-rules {};
          wchisp = pkgs.callPackage ./nix/wchisp {};
          wlink = pkgs.callPackage ./nix/wlink {};
          xpack-riscv-none-elf-gcc  = pkgs.callPackage ./nix/xpack-riscv-none-elf-gcc { inherit system; };
        };

        treefmt = import ./treefmt.nix;
      };
    };
}
