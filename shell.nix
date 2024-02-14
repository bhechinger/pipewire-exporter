{ mkShell, clang, libclang }:
mkShell {
  # Get dependencies from the main package
  #inputsFrom = [ (pkgs.callPackage ./default.nix { }) ];
  # Additional tooling
  buildInputs = [
    clang
    libclang
  ];
}
