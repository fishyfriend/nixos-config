{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../shared/common.nix
    ../platforms/thinkpad-t440s.nix
    ../boot/efi.nix
    ../private/users.nix
  ];

  networking.hostName = "pebbles";
}
