# mrs_toolchain_dir is one of:
# - OpenOCD
# - RISC-V_Embedded_GCC
# - RISC-V_Embedded_GCC12
{ mrs_toolchain_dir ? "RISC-V_Embedded_GCC"
}:

{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, hidapi
, libjaylink
, libusb1
, mrs_toolchain_version ? "1.90"
, mrs_toolchain_hash ? "sha256-PO7uddJg0L2Ugv7CYLpIyRKAiE+8oXU0nG3NAdYse6g="
}:

stdenv.mkDerivation rec {
  pname = "gcc-risc-v-embedded";
  version = mrs_toolchain_version;

  src = fetchurl {
    url = "http://file.mounriver.com/tools/MRS_Toolchain_Linux_x64_V${mrs_toolchain_version}.tar.xz";
    hash = mrs_toolchain_hash;
  };

  buildInputs = [ autoPatchelfHook hidapi libjaylink libusb1 ];

  dontConfigure = true;
  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out/
    cp -r ${mrs_toolchain_dir}/. $out
  '';

  meta = {
  };
}
