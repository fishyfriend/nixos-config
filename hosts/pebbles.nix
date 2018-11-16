# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
