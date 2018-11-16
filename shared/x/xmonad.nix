{ config, pkgs, ... }:

{
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPkgs: with haskellPkgs; [
      xmobar
      xmonad
      xmonad-contrib
      xmonad-extras
    ];
  };

  environment.systemPackages = with pkgs; [
    haskellPackages.xmonad
    haskellPackages.xmobar 
  ];
}
