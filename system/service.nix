{ config, pkgs, ... }: 

{
  services.power-profiles-daemon.enable = true;
  services.v2raya.enable = true;
  services.openssh.enable = true;
  services.pulseaudio.enable = false;
  
  security.rtkit.enable = true;

  services.pipewire = {                                     enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
