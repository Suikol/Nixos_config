{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    neovim
    kitty
    git
    curl
    wget
    unzip
    fuzzel
    waybar
    brightnessctl
    playerctl
    dbus
    swaybg
    xwayland-satellite
    adwaita-icon-theme
    catppuccin-sddm
  ];

  # Fonts
  fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk-sans                                     noto-fonts-color-emoji
   maple-mono.NF-CN
 ];

}
