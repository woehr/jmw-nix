{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Edmonton";

#  fonts.enableCoreFonts = true;
# https://nixos.org/wiki/Fonts
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fontconfig.enable = true;
    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont # some international languages
    ];
  };

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
