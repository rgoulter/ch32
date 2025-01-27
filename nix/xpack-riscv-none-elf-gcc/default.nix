{ lib
, stdenv
, fetchurl
, system
}:

let
  urls =
    {
      "aarch64-darwin" = {
        os = "darwin-arm64";
        hash = "sha256-526GuMUA+OkrO0/3sERM+/OyGFFfMikp4HROw7ntgKg=";
      };
      "x86_64-darwin" = {
        os = "darwin-x64";
        hash = "sha256-im5pnxKHYVLWOG53dnXZRSnMwhpXIkpp2XP2dpSaFoc=";
      };
      "x86_64-linux" = {
        os = "linux-x64";
        hash = "sha256-9XRBW2PxKwm900dSI6tJKkZdI4EGRskME6TDtnbINQM=";
      };
    };
  version = "14.2.0-3";
  url = "https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v${version}/xpack-riscv-none-elf-gcc-${version}-${urls."${system}".os}.tar.gz";
in

stdenv.mkDerivation rec {
  pname = "gcc-risc-v-embedded";
  version = "14.2.0-3";

  src = fetchurl {
    inherit url;
    hash = urls."${system}".hash;
  };

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  noAuditTmpdir = true;

  installPhase = ''
    mkdir -p $out/
    cp -r . $out
  '';
}
