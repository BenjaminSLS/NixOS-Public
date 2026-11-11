{ pkgs, pkgsUnstable, ... }:

{
  # Install user level packages.
  home.packages = with pkgs; [
    # Rust lang.
    cargo
    rustc

    # Godot
    godot
  ] ++ (with pkgsUnstable; [
    # Python
    python3
   
    # IDE
    zed-editor
    xdg-utils
  ]);
}
