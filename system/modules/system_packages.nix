{ config, pkgs, pkgsUnstable, ... }:

{
  imports = [
      # Empty for now
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow Flatpaks
  services.flatpak.enable = true;

  # NixOS packages.
  environment = {
    systemPackages = with pkgs; [
      # Text editor
      helix

      # Office software
      libreoffice
      hunspell
      hunspellDicts.en_US

      # Terminal
      alacritty
    
      # Browsers
      firefox

      # Terminal utilities
      bat
      bottom
      eza
      fzf
      findutils
      gcc
      git
      wget
      zoxide

      # IDE
      vscodium

      # Niri/DMS related software.
      acl
      cups-pk-helper
    
    ] ++ (with pkgsUnstable; [
      # Empty for now
    ]);

    # Set the environment session variables
    sessionVariables = {
      DICPATH = "/run/current-system/sw/share/hunspell";
    };
  };

  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
