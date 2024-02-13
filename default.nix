{ pkgs ? import <nixpkgs> { } }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "pipewire-exporter";
  version = "0.1.0";
  cargoLock.lockFile = ./Cargo.lock;
  src = pkgs.lib.cleanSource ./.;

  # Needed so bindgen can find libclang.so
  LIBCLANG_PATH="${pkgs.llvmPackages.libclang.lib}/lib";

  buildInputs = with pkgs; [
    pipewire
    libclang
  ];

  nativeBuildInputs = with pkgs; [
    pkg-config
    clang
  ];
}
