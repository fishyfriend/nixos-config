{ config, pkgs, ... }:

{
  nix = {
    autoOptimiseStore = true; # deduplicate identical files in the store
    gc.automatic = true; # automatically run the GC at a specific time
    trustedUsers = [ "@wheel" ]; # extra rights when connecting to Nix daemon
  };

  # let unprivileged users use the Nix daemon
  environment.variables.NIX_REMOTE = "daemon";
}
