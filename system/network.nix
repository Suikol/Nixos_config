{ config, pkgs, ... }: 

{
  # Hostname
  networking.hostName = "nixos";

  # Network
  networking.networkmanager.enable = true;

  # Firewall
  networking.firewall.enable = false;
}
