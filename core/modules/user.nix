{ config, lib, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matt = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # Leaving this here for later, but idk where else to put it rn
  programs.zsh = {
    enable = true;
  };
}
