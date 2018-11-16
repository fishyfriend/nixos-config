{ config, pkgs, ... }:

{
  imports = [
    ./display-manager.nix
    ./xmonad.nix
  ];

  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.default = "none";
    displayManager.lightdm.enable = true;
    windowManager.default = "xmonad";
  };

  environment.systemPackages = with pkgs; [
    xclip
  ];
}
