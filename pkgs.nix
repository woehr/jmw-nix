{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    binutils
    chromium
    evince
    file
    gcc49
    gitFull
    gnumake
    nix-repl
    psmisc      # for pstree
    stdenv
    vim
    xclip
    xlibs.xset

    haskellngPackages.ghc
    haskellngPackages.cabal2nix
    haskellngPackages.cabal-install
    haskellngPackages.ghc-mod
  ];
}
