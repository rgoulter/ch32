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
        };

        treefmt = import ./treefmt.nix;
      };
    };
}