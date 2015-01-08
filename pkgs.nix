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
    vim
    xclip
    xlibs.xset
  ];
}
