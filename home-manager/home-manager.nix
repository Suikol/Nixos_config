{ config, pkgs, ... }:

{
  imports = [
    ./shell/shell.nix
    ./desktop/desktop.nix
    ./catppuccin/catppuccin.nix
    ./package/package.nix
  ];

  home.username = "suikol";
  home.homeDirectory = "/home/suikol";
  home.packages = with pkgs; [
    fastfetch
    zip
    xz
    unzip
    file
    which
    tree
    gawk
    zstd
    gnupg
    btop
    lsof
    usbutils
    yazi
    localsend
    prismlauncher
    zulu25
    google-chrome
    git
    kdePackages.dolphin
    mpd
    flac
    mpdris2
    cava
    kdePackages.ark
    scrcpy
    chameleon-cli
    vscode
    obs-studio
    nixfmt
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Suikol";
      email = "3457485859@qq.com";
    };
  };

  home.stateVersion = "25.11";
}
