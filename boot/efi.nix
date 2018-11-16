{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  boot = {
    loader = {
      efi = {
        efiSysMountPoint = "/boot"; # location of EFI System Partition

        # Needed to allow GRUB to modify the boot settings in EFI flash memory.
        # This is useful in case we ever change where GRUB is installed.
        canTouchEfiVariables = true;
      };

      grub = {
        device = "nodev"; # TODO: this should probably be removed or changed
        efiSupport = true;
      };
    };
  };

  environment.systemPackages = [ pkgs.efibootmgr ];
}
