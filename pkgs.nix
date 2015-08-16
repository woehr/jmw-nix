{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    binutils
    file
    gcc49
    gitFull
    gnumake
    nix-repl
    psmisc      # for pstree
    stdenv
    vim_configurable
    xclip
    xlibs.xset

    haskellPackages.cabal2nix
  ];
}
