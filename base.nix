{ config, lib, pkgs, ... }:
{
  imports =
    [ ./conf.nix
      ./pkgs.nix
      ./services.nix
      ./users.nix
    ];
}
