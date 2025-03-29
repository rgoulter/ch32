{ lib, fetchFromGitHub, rustPlatform, pkg-config, libusb1 }:

rustPlatform.buildRustPackage rec {
  pname = "wchisp";
  version = "git";
  nativeBuildInputs = [pkg-config];
  buildInputs = [libusb1];
  src = fetchFromGitHub {
    owner = "ch32-rs";
    repo = pname;
    rev = "c47962d214fe3d44b47d8be989eb94990ac4081f";
    hash = "sha256-Bd51ztuhp1HiW8Edq8bGjRvXfr/zlYsanKqJxj2ujk8=";
  };
  cargoHash = "sha256-RFnVz28ZPNh74Hc1nr+lGdZGDB01G7ZieHB8qzcUeWQ=";
}
