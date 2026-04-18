{config, pkgs, ... }:

{
  catppuccin = {
    flavor = "macchiato";
    accent = "lavender";

    opencode.enable = false;
  };

  # Cursors
  catppuccin.cursors = {
    enable = true;
  };

  home.pointerCursor = {
  name = "catppuccin-macchiato-lavender-cursors";
  size = 24;
  };

  # QT
  qt = {
    enable = true;
    style.name = "kvantum";
      };

  catppuccin.kvantum = {
    enable = true;
    apply = true;
    assertStyle = true;
  };
}
