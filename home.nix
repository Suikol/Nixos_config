{ config, pkgs, ... }:

{
  imports =
    [
      ./shell/shell.nix
    ];

  home.username = "suikol";
  home.homeDirectory = "/home/suikol";
  home.packages = with pkgs;[
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
    rmpc
    mpd
    mpdris2
    cava
  ];

  programs.git = {
    enable = true;
    userName = "Suikol";
    userEmail = "3457485859@qq.com";
  };

  home.stateVersion = "25.11";
}
