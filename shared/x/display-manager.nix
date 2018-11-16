{ config, pkgs, ... }:

{
  services.xserver.displayManager.lightdm = {
    background = "#000000";
    extraSeatDefaults = "greeter-hide-users = true";
    greeters.gtk = {
      clock-format = "%a %b %e, %H:%M %Z";
      extraConfig = "hide-user-image = true";
      indicators = ["sound" "~spacer" "~clock" "~spacer" "~session" "~power"];
      theme = {
        name = "Arc-Dark";
        package = pkgs.arc-theme;
      };
    };
  };
}
