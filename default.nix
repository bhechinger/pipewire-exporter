{stdenv, ncurses, pipewire, libprom, libpromhttp, libmicrohttpd} :
stdenv.mkDerivation {
  name = "pipewire-exporter";
  #nativeBuildInputs = [
  #  pkgs.cmake
  #];

  buildInputs = [
    ncurses
    pipewire
    libprom
    libpromhttp
    libmicrohttpd
  ];

  src = ./src;

  # Use $CC as it allows for stdenv to reference the correct C compiler
  buildPhase = ''
    $CC pw-exporter.c \
      -I ${pipewire.dev}/include/spa-0.2 \
      -I ${pipewire.dev}/include/pipewire-0.3 \
      -L ${pipewire.dev}/lib \
      -lncurses \
      -lpipewire-0.3 \
      -lprom \
      -lpromhttp \
      -lmicrohttpd \
      -g \
      -o pw-exporter
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp pw-exporter  $out/bin/pw-exporter
  '';
}