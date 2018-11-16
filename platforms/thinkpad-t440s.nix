{ config, pkgs, ... }:

{
  boot.extraModprobeConfig = ''
    # Specify sound card indices using vendor and product IDs so that the
    # PCH sound card is primary. (The values of the `vid` and `pid` fields
    # are given by `lspci -nn | grep audio`.)
    options snd-hda-intel index=0 vid=8086 pid=9c20 # PCH sound card
    options snd-hda-intel index=1 vid=8086 pid=0a0c # HDMI sound card
    
    # Disable the touchpad's InterTouch bus capability as a workaround for
    # a bug that breaks two-finger scrolling after wake from suspend
    # (https://bugzilla.kernel.org/show_bug.cgi?id=196719). Touchpad will use
    # the PS/2 bus.
    options psmouse synaptics_intertouch=0

    # options thinkpad_acpi fan_control=1 # TODO: needed? req'd by ThinkFan?
  '';

  boot.loader.grub.gfxmodeEfi = "1920x1080";

  # TODO: configure or remove this
  services.thinkfan.enable = false; # fan controller for ThinkPad

  services.xserver = {
    libinput = {
      enable = true; # Enable touchpad support.
      naturalScrolling = true; # TODO: does this duplicate multitouch.invertScroll?
    };
  
    multitouch = {
      enable = true;
      ignorePalm = true;
      invertScroll = true; # TODO: is this duplicating libinput.naturalScrolling?
    };
  
    # Deprecated: Consider services.xserver.libinput.enable
    # TODO: remove?
    synaptics = {
      horizTwoFingerScroll = true;
      vertTwoFingerScroll = true;
    };

    xkbOptions = builtins.concatStringsSep "," [
      "altwin:prtsc_rwin"       # use PrtSc as an additional Win key
    ];
  };
}
