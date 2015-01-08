{ config, lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      desktopManager.default = "none";
      desktopManager.xterm.enable = false;

      displayManager.sessionCommands = ''
        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name leftptr
        ${pkgs.xlibs.xset}/bin/xset -dpms
        ${pkgs.xlibs.xset}/bin/xset s off
      '';
      displayManager.lightdm.enable = true;

      windowManager.default = "xmonad";
      windowManager.xmonad.enable = true;
      windowManager.xmonad.enableContribAndExtras = true;
    };
  };
}
