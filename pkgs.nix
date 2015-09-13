{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ack
    binutils
    cabal2nix
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
  ];
}
