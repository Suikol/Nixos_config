{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.segger-jlink.acceptLicense = true;
  nixpkgs.config.permittedInsecurePackages = [
    "segger-jlink-qt4-874"
  ];

  programs.zsh.enable = true;
  
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraArgs = "-cef-disable-gpu-compositing";
      };
    })   
  ];
  
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

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

    (let base = pkgs.appimageTools.defaultFhsEnvArgs; in
      pkgs.buildFHSEnv (base // {
      name = "fhs";
      targetPkgs = pkgs:
        (base.targetPkgs pkgs) ++ (with pkgs; [
          pkg-config
          ncurses
	  gnumake
	  nrfutil
          nrf-command-line-tools
        ]
      );
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
    }))
  ];

  # Fonts
  fonts.packages = with pkgs; [
   noto-fonts
   noto-fonts-cjk-sans                                     noto-fonts-color-emoji
   maple-mono.NF-CN
 ];

}
