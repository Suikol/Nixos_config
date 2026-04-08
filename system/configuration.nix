{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./display.nix
      ./package.nix
      ./user.nix
      ./locale.nix
      ./service.nix
      ./network.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  system.stateVersion = "25.11";

}
