{ config, pkgs, ... }:

{
  environment.variables.EDITOR = "vi";

  environment.systemPackages = with pkgs; [
    nano
    # TODO: add a `view` alias
    (neovim.override { viAlias = true; vimAlias = true; })
  ];
}
