{ config, pkgs, ... }:

{
  environment.variables.TERMINAL = "urxvtc";
  services.urxvtd.enable = true;

  # Enable xterm as a desktop manager as an emergency fallback
  services.xserver.desktopManager.xterm.enable = true;

  environment.systemPackages = with pkgs; [
    # TODO: Move this customization to a development environment for rxvt_unicode
    (rxvt_unicode_with-plugins.overrideAttrs (attrs: {
      configureFlags = [ "--enable-assert" "--enable-warnings" ];
    }))

    xterm # required by services.xserver.desktopManager.xterm.enable
  ];
}
