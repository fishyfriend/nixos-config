{ config, pkgs, ... }:

{
  imports = [
    ./display-manager.nix
    ./xmonad.nix
  ];

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.lightdm.enable = true;
    windowManager.default = "xmonad";
    desktopManager.default = "none";
  };

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
