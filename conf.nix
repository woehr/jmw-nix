{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Edmonton";

  fonts.enableCoreFonts = true;

  programs = {
    zsh.enable = true;
  };
  
  nixpkgs.config.allowUnfree = true;
}
