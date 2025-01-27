{ lib
, stdenv
, fetchurl
}:

# darwin- arm64, x64
# linux- arm64, x64
# https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v14.2.0-3/xpack-riscv-none-elf-gcc-14.2.0-3-darwin-x64.tar.gz

stdenv.mkDerivation rec {
  pname = "gcc-risc-v-embedded";
  version = "14.2.0-3";

  src = ./xpack-riscv-none-elf-gcc-14.2.0-3-darwin-x64.tar.gz;
  # src = fetchurl {
  #   url = "http://file.mounriver.com/tools/MRS_Toolchain_Linux_x64_V${mrs_toolchain_version}.tar.xz";
  #   hash = mrs_toolchain_hash;
  # };

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  noAuditTmpdir = true;

  installPhase = ''
    mkdir -p $out/
    cp -r . $out
  '';
}
