{ config, pkgs, ... }:

{
  users.users.suikol = {
    isNormalUser = true;
    description = "suikol";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
