{ config, pkgs, ... }:

{
  time.timeZone = "America/New_York";

  # update timezone dynamically with `localtime` daemon utilizing GeoClue2
  # TODO: this may not be working
  services.localtime.enable = true;
}
