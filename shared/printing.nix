{ config, pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
    # TODO: configure tohaku as a Generic PCL-5e printer?
  };
}
