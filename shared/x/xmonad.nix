{ config, pkgs, ... }:

# Use GHC 8.2.2 to avoid a segfault bug that crashes xmobar. The bug is
# fixed in GHC 8.6.1.
# TODO: remove this customization once NixOS uses 8.6.1+ by default.
let customHaskellPackages = pkgs.haskell.packages.ghc822;
in {
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    haskellPackages = customHaskellPackages;
    extraPackages = haskellPackages: with haskellPackages; [
      xmobar
      xmonad
      xmonad-contrib
      xmonad-extras
    ];
  };

  environment.systemPackages = with customHaskellPackages; [
    xmonad
    xmobar
  ];
}
