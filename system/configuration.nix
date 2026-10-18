{ config, pkgs, username, hostname, private, personal, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    "${private}/system/hardware-configuration.nix"

    # Include the NixOS general system package module.
    ./modules/system_packages.nix

    # Include specific NixOS system modules.
    ./modules/desktops.nix
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Boot
  boot = {
    # Bootloader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "${hostname}"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = personal.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = personal.locale;

  # Enable the X11 windowing system.
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Disable pulseaudio.
    pulseaudio.enable = false;

    # Enable pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Enable security options.
  security = {
    # Rootkit
    rtkit.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.nushell;
    packages = [];
  };

  # System version
  system.stateVersion = "26.05";
}
