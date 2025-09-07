{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
    pkgs.git
    pkgs.grub2
    pkgs.xorriso
    pkgs.wget
  ];

}
