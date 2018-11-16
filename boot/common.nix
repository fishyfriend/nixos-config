{ config, pkgs, ... }:

{
  boot = {
    cleanTmpDir = true; # remove temp files on every boot
    earlyVconsoleSetup = true; # set font during initrd phase (cosmetic)

    loader = {
      timeout = 2; # seconds until loader boots the default menu selection

      grub = {
        configurationLimit = 30; # max configurations
        #font = "${pkgs.grub2}/share/grub/unicode.pf2"; # TODO
        #fontSize = TODO; # ignored unless font is .ttf or .otf
        splashImage = null; # use text mode
      };
    };
  };
}
