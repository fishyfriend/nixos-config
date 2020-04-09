*ARCHIVED*

nixos-config contained the system configurations for my personal computer running NixOS. It was superseded by my config repository on Nov. 18, 2018, on which date its source tree was copied verbatim into the `nixos/` subdirectory there. The revision history was not copied, so the present archive is kept for the purpose of preserving it.

# Layout

`hosts/` contains versions of `configuration.nix` specialized for each computer.

`shared/` contains Nix expressions that are common to all the configured computers. Import `shared/common.nix` to pull them all in.

`platforms/` contains configuration items for specific computer models.

`boot/` has configurations for different boot modes (EFI or BIOS).

`private/` is referenced by the host configurations but is not tracked in source control. It should contain `users.nix` with a list of users, e.g.:

    { config, pkgs, ... }:

    {
      users.users = {
        marilyn = {
          uid = 1000;
          home = /home/marilyn;
          group = "wheel";
          extraGroups = [ "audio" ];
          # etc.

# Installation

To set up NixOS using this repository, you must replace `/etc/nixos/configuration.nix` with a symlink to one of the host configurations. You must also create a `private/users.nix` file as described above.

Example:

    cd ~/code
    git clone git@github.com:fishyfriend/nixos-config
    sudo mv /etc/nixos/configuration.nix /backups
    sudo ln -s ~/code/nixos-config/hosts/martha.nix /etc/nixos/configuration.nix
    sudo nixos-generate-config
    mkdir private
    vi private/users.nix
    sudo nixos-rebuild switch

# Further reading

[NixOS manual][1]

[1]: https://nixos.org/nixos/manual/index.html#nixos-manual
