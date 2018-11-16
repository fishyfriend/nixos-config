{ config, pkgs, ... }:

{
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true; # include 32-bit libraries
    package = pkgs.pulseaudioFull;
  };

  # Enable/disable explicit support for PulseAudio in packages.
  # Leave this off! It requires lengthy builds as some packages (e.g. chromium)
  # do not have an appropriate binary available. Also, it may have caused
  # sound playback issues in the past. PulseAudio support should be enabled
  # individually for each package that needs it.
  #nixpkgs.config.pulseaudio = true;

  environment.systemPackages = [ pkgs.alsaUtils ];
}
