{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    binutils
    chromium
    evince
    file
    gitFull

    haskellngPackages.ghc
    haskellngPackages.cabal2nix
    haskellngPackages.cabal-install
    haskellngPackages.ghc-mod

    nix-repl
    stdenv
    vim
    xclip
    xlibs.xset
  ];
}
