{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Edmonton";

  fonts.enableCoreFonts = true;

  programs = {
    zsh.enable = true;
  };

  nix = {
    trustedBinaryCaches = [ http://hydra.cryp.to ];
    binaryCachePublicKeys = [
      "hydra.cryp.to-1:8g6Hxvnp/O//5Q1bjjMTd5RO8ztTsG8DKPOAg9ANr2g="
    ];
    extraOptions = "auto-optimise-store = true";
  };

  nixpkgs = {
    config.allowUnfree = true;
  };
}
