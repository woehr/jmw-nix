{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    binutils
    chromium
    evince
    file
    gitFull
    haskellPackages.cabal2nix
    haskellPackages.cabalInstall
    haskellPackages.ghc
    haskellPackages.ghcMod
    vim
    xclip
    xlibs.xset
  ];
}
