{ config, pkgs, ... }:
{
  imports =[ /etc/nixos/hardware-configuration.nix ];

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
      bash
      bashInteractive
      binutils
      coreutils
      diffutils
      docker
      file
      findutils
      gawk
      gitAndTools.gitFull
      gnugrep
      gnumake
      gnused
      gnutar
      gzip
      mercurial
      nix
      openssh
      perl
      psmisc
      python3
      ripgrep
      ruby
      rxvt_unicode
      shared_mime_info
      sudo
      tree
      which
      xclip
      xz
    ];
    pathsToLink = [ "share" ];
  };

  programs = {
    ssh = {
      startAgent = true;
    };
  };

  services = {
    xserver = {
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
  };

  users.extraUsers = {
    jordan = {
      createHome = true;
      extraGroups = [ "disk" "docker" "vboxusers" "wheel" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
  };

  virtualisation.docker.enable = true;

  security.sudo.enable = true;
  system.nixos.stateVersion = "18.03";
}
