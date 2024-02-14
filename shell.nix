{ pkgs }:
pkgs.mkShell {
  # Get dependencies from the main package
  #inputsFrom = [ (pkgs.callPackage ./default.nix { }) ];
  # Additional tooling
  buildInputs = with pkgs; [
    pkg-config
    pipewire
    clang
    libclang
    meson
  ];
}
