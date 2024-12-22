{ lib, fetchFromGitHub, rustPlatform, pkg-config, udev }:

rustPlatform.buildRustPackage rec {
  pname = "wlink";
  version = "git";
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    udev.dev
  ];
  src = fetchFromGitHub {
    owner = "ch32-rs";
    repo = pname;
    rev = "217f0e5136892ffcc6a80204a601bc1b62159505";
    hash = "sha256-XxPvnIovShPvOhviLcVh2/+jwj27wS6WBHSeU6q8AIw=";
  };
  cargoHash = "sha256-uiO+9pKvV+cXqhp/vyTWKQPJQ0CuVE8FpcupXsOvWLw=";
}
