{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Edmonton";

  fonts.enableCoreFonts = true;

  programs = {
    zsh.enable = true;
  };
  
  nix.extraOptions = "auto-optimise-store = true";
  nixpkgs.config.allowUnfree = true;
}
