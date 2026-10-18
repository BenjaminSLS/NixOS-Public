{ config, pkgs, ... }:

{
  programs = {
    # DMS Shell
    dms-shell = {
      enable = true;

      systemd = {
        enable = true;             # Systemd service for auto-start
        restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
      };
  
      # Core features
      enableSystemMonitoring = true;     # System monitoring widgets (dgop)
      enableVPN = true;                  # VPN management widget
      enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
      enableAudioWavelength = true;      # Audio visualizer (cava)
      enableCalendarEvents = true;       # Calendar integration (khal)
    }; 

    # Niri WM
    niri = {
      enable = true;
    };
  };

  # Gnome DE and GDM.
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
