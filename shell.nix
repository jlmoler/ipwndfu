let
  nixpkgs = (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/release-21.05.tar.gz);
  arm64cross = import nixpkgs {
    crossSystem = (import "${nixpkgs}/lib").systems.examples.aarch64-multiplatform;
  };
in

with (import nixpkgs {});

pkgs.mkShell {
  nativeBuildInputs = [
    (python2.withPackages(ps: with ps; [ pyusb ]))
    gcc-arm-embedded
    arm64cross.stdenv.cc
  ];
}
