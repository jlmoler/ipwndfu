with (import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz) {});

pkgs.mkShell {
  buildInputs = [
    (python2.withPackages(ps: with ps; [ pyusb ]))
    gcc-arm-embedded
  ];
}
