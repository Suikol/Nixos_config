{ lib, pkgs, ... }:

{
  # SDDM
  services.displayManager.sddm = {
     enable = true;
     wayland.enable = true;
     theme = "catppuccin-mocha-mauve";
   };

  # Niri
  programs.niri.enable = true;

  # Nvidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };
}
