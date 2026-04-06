{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      (fcitx5-rime.override {
        rimeDataPkgs = [
          pkgs.rime-ice
        ];
      })
    ];
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-mauve";
  #  autoLogin.enable = true;
  #  autoLogin.user = "suikol";
  };

  services.power-profiles-daemon.enable = true; 
  programs.niri.enable = true;
  services.v2raya.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.suikol = {
    isNormalUser = true;
    description = "suikol";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      yazi
      fastfetch
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
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;

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
    mako
  ];

 fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk-sans
   noto-fonts-color-emoji
   maple-mono.NF-CN
 ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.udisks2.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "25.11";

}
