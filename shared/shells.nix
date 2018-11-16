{ config, pkgs, ... }:

{
  programs = {
    bash.enableCompletion = true;
    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };
}
