# Help is available in the configuration.nix(5) man page, on https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.dwl
  ];

}
