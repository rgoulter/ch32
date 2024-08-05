args@{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, hidapi
, libjaylink
, libusb1
, mrs_toolchain_version ? "1.90"
, mrs_toolchain_hash ? "sha256-PO7uddJg0L2Ugv7CYLpIyRKAiE+8oXU0nG3NAdYse6g="
}:

{
  openocd = (import ./base.nix { mrs_toolchain_dir = "OpenOCD"; }) args;
  riscv-embedded-gcc = (import ./base.nix { mrs_toolchain_dir = "RISC-V_Embedded_GCC"; }) args;
  riscv-embedded-gcc12 = (import ./base.nix { mrs_toolchain_dir = "RISC-V_Embedded_GCC12"; }) args;
}
