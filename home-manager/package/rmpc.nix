{ pkgs, config, ... }:

{
  programs.rmpc = {
    enable = true;

    config = ''
      (
        address: "127.0.0.1:6600",

        lyrics: (
          lyrics_dir: "/home/suikol/Music",
        ),
      )
    '';
  };
}
