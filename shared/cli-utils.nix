{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # compression
    dos2unix
    unzip
    zip

    # disk management
    parted

    # hardware
    hdparm
    hwinfo
    pciutils
    usbutils

    # process management
    cpulimit
    htop
    lsof
    psmisc
  ];
}
