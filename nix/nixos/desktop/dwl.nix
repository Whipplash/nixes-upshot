# Help is available in the configuration.nix(5) man page, on https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  pkgs,
  ...
}:
let
  cfg = ../../../dots;
in
{
  home.packages = [
    (pkgs.dwl.override {
      # trying to supply config.home.homeDirectory here leads to "impure" usage.
      # so disabling it for now.
      # conf = (builtins.readFile "${config.home.homeDirectory}/.config/dwl/config.h");
      configH = builtins.readFile "${cfg}/dwl/config.h";
    })
    pkgs.somebar
    pkgs.wbg
  ];

}
