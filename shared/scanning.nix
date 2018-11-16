{ config, pkgs, ... }:

{
  hardware.sane.enable = true; # enable support for SANE scanners
  environment.systemPackages = [ pkgs.xsane ];
}
