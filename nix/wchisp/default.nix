{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "wchisp";
  version = "git";
  src = fetchFromGitHub {
    owner = "ch32-rs";
    repo = pname;
    rev = "c47962d214fe3d44b47d8be989eb94990ac4081f";
    hash = "sha256-Bd51ztuhp1HiW8Edq8bGjRvXfr/zlYsanKqJxj2ujk8=";
  };
  cargoHash = "sha256-6v66yJZVtMdFNRIKNhf7aYalHGJvbNrslq46woAI7GQ=";
}
