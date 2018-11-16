{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.git ];
  services.locate.pruneNames = [ ".git" ];
}
