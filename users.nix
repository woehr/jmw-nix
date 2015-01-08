{ config, lib, pkgs, ... }:
{
  users = {
    extraUsers.jordan = {
      name = "jordan";
      group = "users";
      uid = 1000;
      extraGroups = [ "wheel" ];
      createHome = true;
      home = "/home/jordan";
      shell = "/run/current-system/sw/bin/zsh";
    };
  };
}
