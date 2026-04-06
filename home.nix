{ config, pkgs, ... }:

{
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
  ];

  programs.git = {
    enable = true;
    userName = "Suikol";
    userEmail = "3457485859@qq.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    '';
  };
  home.stateVersion = "25.11";
}
