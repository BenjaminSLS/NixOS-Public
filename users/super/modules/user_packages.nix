{ pkgs, pkgsUnstable, private, ... }:

{
  # Install private packages that is entirely private per user.
  imports = [ (private + "/private-packages.nix") ];

  # Install user level packages.
  home.packages =
    (with pkgs; [
      # Browser
      tor-browser

      # Music player
      kew
   
      #Gleam
      gleam

      # Keyboard and mouse configurations.
      #piper
      #system76-keyboard-configurator

      # Terminal / Shell
      rio
    ])
    ++ (with pkgsUnstable; [   
      # Privacy software.
      proton-vpn
    ]);
}
