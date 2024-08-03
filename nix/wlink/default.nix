{ lib, fetchFromGitHub, rustPlatform, pkg-config, udev }:

rustPlatform.buildRustPackage rec {
  pname = "wlink";
  version = "nightly";
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    udev.dev
  ];
  src = fetchFromGitHub {
    owner = "ch32-rs";
    repo = pname;
    rev = "fd31f2b614ab462a84d8508108445142c2af72ec";
    hash = "sha256-fKbtLGD6ch9S8WP2UhUBFisYko6BKK8v9HaHstUAKoE=";
  };
  cargoHash = "sha256-u1E+oAV7KM6xfYghjg/E1eQhSqF0PrcBvX7UQQGY6gM=";
}
