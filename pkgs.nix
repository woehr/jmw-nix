{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ack
    binutils
    cabal2nix
    emacs
    file
    gcc
    gitFull
    gnumake
    nix-repl
    psmisc      # for pstree
    rxvt_unicode
    stdenv
    vim_configurable
    xclip
    xlibs.xset
  ];
}
