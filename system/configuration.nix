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
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  system.stateVersion = "25.11";

}
