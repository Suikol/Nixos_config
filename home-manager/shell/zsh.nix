{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      ff = "fastfetch";
      vim = "nvim";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];

      theme = "robbyrussell";
    };
  };
}
