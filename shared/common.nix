{ config, pkgs, ... }:

{
  imports = [
    ./x/common.nix
    ./cli-utils.nix
    ./editors.nix
    ./fonts.nix
    ./git.nix
    ./networking.nix
    ./nix.nix
    ./printing.nix
    ./scanning.nix
    ./security.nix
    ./shells.nix
    ./sound.nix
    ./terminals.nix
    ./timezone.nix
  ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09";

  # TODO: turn this on?
  #gnu = true;

  services = {
    # filename indexer
    locate = {
      enable = true;
      interval = "hourly";
      # TODO
      #extraFlags = [ "--prunepaths='/tmp /usr/tmp /var/tmp /.git/"' ];
    };

    # time-adjusted screen dimmer
    redshift = {
      enable = true;
      provider = "geoclue2";
    };

    # brightness control using hot keys
    illum.enable = true;

    # temperature management daemon
    thermald.enable = true;
  };
}
