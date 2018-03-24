{ config, pkgs, ... }:
{
  imports =[ ./hardware-configuration.nix ];

  fileSystems = {
    "/GDrive" = {
      fsType = "vboxsf";
      device = "GDrive";
      options = [ "rw" ];
    };
    "/Dropbox" = {
      fsType = "vboxsf";
      device = "Dropbox";
      options = [ "rw" ];
    };
  };

  boot = {
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
    initrd.checkJournalingFS = false;
  };

  nix.extraOptions = "auto-optimise-store = true";
  nixpkgs.config.allowUnfree = true;

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro corefonts dejavu_fonts font-droid freefont_ttf google-fonts
      inconsolata liberation_ttf powerline-fonts source-code-pro terminus_font
      ttf_bitstream_vera ubuntu_font_family unifont
    ];
  };

  time.timeZone = "America/Edmonton";

  environment = {
    systemPackages = with pkgs; [
      binutils coreutils diffutils findutils
      bash bashInteractive file psmisc sudo which xz
      gawk gnugrep gnumake gnused gnutar gzip
      openssh rxvt_unicode xclip xdotool
      gitAndTools.gitFull mercurial
      neovim emacs
      nix nix-repl
      shared_mime_info
    ];
    pathsToLink = [ "share" ];
  };

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager = {
      lightdm = {
        enable = true;
        autoLogin.enable = true;
        autoLogin.user = "jordan";
        greeter.enable = false;
      };
    };
  };

  users.extraUsers = {
    jordan = {
      createHome = true;
      extraGroups = [ "wheel" "disk" "vboxusers" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
  };

  security.sudo.enable = true;
  system.stateVersion = "17.09";
}
