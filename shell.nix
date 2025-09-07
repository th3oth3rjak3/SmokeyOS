let
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.05.tar.gz";
  };
  pkgs = import nixpkgs { };
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkgsCross.i686-embedded.buildPackages.gcc
    pkgsCross.i686-embedded.buildPackages.binutils
    pkgsCross.i686-embedded.buildPackages.gdb
    gnumake
    qemu_kvm
  ];

  shellHook = ''
    export CROSS_PREFIX=i686-elf-
    export ARCH=i686
    echo "SmokeyOS dev ready!"
  '';
}
