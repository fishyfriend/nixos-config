{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true; # /run/current-system/sw/share/X11-fonts
    enableGhostscriptFonts = true;

    fontconfig = {
      cache32Bit = true; # generate system fonts cache for 32-bit applications
      defaultFonts = {
        monospace = [ "Liberation Mono" ];
        sansSerif = [ "Liberation Sans" ];
      };
    };

    fonts = with pkgs; [ terminus_font ];
  };
}
