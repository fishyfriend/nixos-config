{ config, pkgs, ... }:

{
  networking = {
    # Use NetworkManager for automatic network configuration. All users that
    # need access must be added to the `networkmanager` group.
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bind
    bmon
    inetutils # TODO: remove? this appears to be standard
    netcat
    tcptrack
    telnet
    traceroute
    wget
    whois
  ];
}
