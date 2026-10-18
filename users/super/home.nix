{ config, username, personal, ... }:

{
  # Import user level package file.
  imports = [
    # Specific .nix files
    ./modules/programming.nix
    ./modules/user_packages.nix
  ];

  # Set user.
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "hx";
    };
  };
}
