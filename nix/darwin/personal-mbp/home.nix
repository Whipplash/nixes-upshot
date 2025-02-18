{
  pkgs,
  ...
}:
let
  cfg = ../../../dots;
  u-hm = ./../../universal-modules; # universal Home Manager modules
  nd = ./../modules;
in
{

  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;

  imports = [
    "${u-hm}/fish.nix"
    "${u-hm}/kitty.nix"
    "${u-hm}/nvim.nix"
    "${u-hm}/tmux.nix"
  ];

  home.file = {
    ".config/alacritty".source = "${cfg}/alacritty";
    ".config/fastfetch".source = "${cfg}/fastfetch";
    ".config/nvim".source = "${cfg}/nvim";
  };

  home.sessionVariables = {
    # Fixes Rust Compiling the LSP
    PATH = "/usr/bin/:$PATH";
    TERM = "xterm-256color";
    EDITOR = "nvim";
  };

  home.packages = [
    # Editors
    pkgs.vim

    # Development
    pkgs.ansible
    pkgs.ansible-builder
    pkgs.ansible-lint
    pkgs.ansible-navigator
    pkgs.gcc
    pkgs.gnumake
    pkgs.nodejs
    pkgs.python3
    pkgs.rustup
    pkgs.yamlfmt

    # Git
    pkgs.gh
    pkgs.gitflow

    # Terminal
    pkgs.alacritty
    pkgs.bat
    pkgs.btop
    pkgs.fastfetch
    pkgs.fzf
    pkgs.htop
    pkgs.lazygit
    pkgs.lsd
    pkgs.ripgrep
    pkgs.starship
    pkgs.tree
    pkgs.sshpass

    # Fish
    pkgs.fish
    pkgs.grc

    # Containerization
    pkgs.podman
    pkgs.podman-compose
  ];

  programs = {
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = pkgs.lib.importTOML "${cfg}/starship/starship.toml";
    };
    fzf = {
      enable = true;
    };
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile "${cfg}/wezterm/wezterm.lua";
    };
  };
}
