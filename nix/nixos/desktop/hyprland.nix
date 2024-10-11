# Help is available in the configuration.nix(5) man page, on https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  inputs,
  pkgs,
  ...
}:
let
  user = "matt";
  hostname = "upshot";
in
{

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # Cachix for Hyprland
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  programs.hyprland.portalPackage =
    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

  # greetd = {
  #   enable = true;
  #   settings = rec {
  #     initial_session = {
  #       command = "${pkgs.stdenv.hostPlatform.system}.hyprland;/bin/hyprland";
  #       user = "${user}";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  environment.systemPackages = with pkgs; [
    fuzzel
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    kitty
    libnotify
    mako
    waybar
    wl-clipboard
  ];
}
