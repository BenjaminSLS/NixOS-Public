{ pkgs, pkgsUnstable, ... }:

{
  # Install user level packages.
  home.packages = with pkgs; [
    # Browsers and related software.
    tor-browser

    # Music player
    sayonara
   
    #Gleam
    gleam

    # Keyboard and mouse configurations.
    #piper
    #system76-keyboard-configurator

    # Terminal / Shell
    rio

  ] ++ (with pkgsUnstable; [
    # Privacy software.
    proton-vpn
  ]);
}
