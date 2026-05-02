{ config, pkgs, ... }:

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
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.legacy_580 ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };
}
