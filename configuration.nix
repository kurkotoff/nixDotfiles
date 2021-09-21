# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./themes.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelParams = [ "pcie_aspm=off" "pci=nomsi" ];
    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sda";
    };
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    useDHCP = false;
    interfaces = {
      enp2s0f2.useDHCP = true;
      wlp3s0.useDHCP = true;
    };
  #  wireless.Serg0Net21 = {
  #    psk = "_-2W@I1-_";
  #  };
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    #Xorg
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      videoDrivers = [ "nvidia" ];
      layout = "us,ru";
      xkbOptions = "grp:alt_shift_toggle";
      libinput.enable = true;
    };

    #CUPS for printing
    printing.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;
    steam-hardware.enable = true;
    
    nvidia = {
      modesetting.enable = true;
      prime = {
        offload.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  #Enable sound
  sound.enable = true;

  #Define user
  users.users.kurkotoff = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    home = "/home/kurkotoff/";
    description = "kurkotoff";
  };

  # environment.systemPackages = with pkgs; [
  #   neovim
  #   wget
  #   firefox
  #   steam
  # ];
  
  programs = {
    steam.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system.stateVersion = "21.05";

}

