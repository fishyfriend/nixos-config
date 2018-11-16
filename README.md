nixos-config contains the system configurations for my personal computers running NixOS.

# Layout

`hosts/` contains versions of `configuration.nix` specialized for each computer.

`shared/` contains Nix expressions that are common to all the configured computers. Import `shared/common.nix` to pull them all in.

`platforms/` contains configuration items for specific computer models.

`boot/` has configurations for different boot modes (EFI or BIOS).

`private/` is referenced by the host configurations but is not tracked in source control. It should contain `users.nix` with a list of users, e.g.:

    { config, pkgs, ... }:

    {
      users.users = {
        martha = {
          uid = 1000;
          home = /home/martha;
          group = "wheel";
          extraGroups = [ "audio" ];
          # etc.

# Installation

To set up NixOS using this repository, you replace `/etc/nixos/configuration.nix` with a symlink to one of the host configurations. Example:

    cd ~/code
    git clone git@github.com:fishyfriend/nixos-config
    sudo nixos-generate-config
    sudo mv /etc/nixos/configuration.nix /backups
    sudo ln -s ~/code/nixos-config/hosts/martha.nix /etc/nixos/configuration.nix
    sudo nixos-rebuild switch

# Further reading

[NixOS manual][1]

[1]: https://nixos.org/nixos/manual/index.html#nixos-manual
