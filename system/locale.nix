{ lib, pkgs, ... }:

{
  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {                              LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";                              };

  # Zone
  time.timeZone = "Asia/Shanghai";

  # Fcitx5
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
}
