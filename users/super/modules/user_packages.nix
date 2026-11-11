{ pkgs, pkgsUnstable, ... }:

{
  # Install user level packages.
  home.packages = with pkgs; [
    # Browsers and related software.
    mullvad-browser
    mullvad-vpn
    tor-browser

    # Notes app
    notesnook

    # Music player
    kew
   
    #Gleam
    gleam

    # Keyboard and mouse configurations.
    #piper
    #system76-keyboard-configurator

    # Terminal / Shell
    rio

  ] ++ (with pkgsUnstable; [
    # Browsers
    ladybird

    # Privacy software.
    proton-vpn
  ]);
}
