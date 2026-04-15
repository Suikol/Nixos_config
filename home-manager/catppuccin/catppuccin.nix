{config, pkgs, ... }:

{
  catppuccin = {
    flavor = "macchiato";
    accent = "lavender";
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
  };
}
