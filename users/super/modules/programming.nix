{ pkgs, pkgsUnstable, ... }:

{
  # Install user level packages.
  home.packages = with pkgs; [
    # Rust lang.
    cargo
    rustc
  ] ++ (with pkgsUnstable; [
    # Python
    python3
    
    # IDE
    zed-editor
  ]);
}
