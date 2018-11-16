{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.git ];

  # Only works with mlocate, not GNU findutils locate
  #services.locate.pruneNames = [ ".git" ];
}
