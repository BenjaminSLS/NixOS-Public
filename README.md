<div align="center">

# NixOS-Public - Declarative NixOS Configuration

![NixOS](https://img.shields.io/badge/NixOS-Stable-blue)
![Flakes](https://img.shields.io/badge/Nix-Flakes-informational)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

*A declarative [NixOS](https://nixos.org) desktop built using [Flakes](https://wiki.nixos.org/wiki/Flakes) and [Home Manager](https://wiki.nixos.org/wiki/Home_Manager) with the [DMS](https://danklinux.com/) desktop and [Niri](https://niri-wm.github.io/niri/) Wayland compositor.  The system — packages, services, dotfiles, and user environment — is defined in code and rebuilt atomically from a pinned `flake.lock` file.  Reproducible from a single clone.*

</div>

## The Stack

| Area | Tools |
| --- | --- |
| Operating System | NixOS |
| Kernel | Linux |
| Desktop | Niri, DMS |
| Config Management | configuration.nix, Home Manager, Flakes |
| Programming Languages | [Nix](https://nix.dev/tutorials/nix-language.html) |
| Development Tools | [Zed](https://zed.dev/), [Helix](https://helix-editor.com/) |
| System Navigation | [Rio](https://rioterm.com/), [Nushell](https://www.nushell.sh/), [Zoxide](https://github.com/ajeetdsouza/zoxide) |

## Structure

```text
syste_files
├── public/                            # Publicly available NixOS configuration
│   ├── .git/
│   ├── flake.nix                      # Inputs + outputs
│   ├── flake.lock                     # Pinned dependency versions
│   ├── system/
│   │   ├── configuration.nix          # System-wide config
│   │   ├── hardware-configuration.nix # Machine hardware-specific config
│   │   └── modules/                   # Reusable NixOS modules
│   ├── users/
│   │   └── primary/
│   │       ├── home.nix               # User-specific home-manager config
│   │       └── modules/               # User-specific modules
│   ├── README.md                      # The README.md files you are currently reading.
│   └── LICENSE
└── private/                           # Personal information to be kept private
    ├── .git/
    ├── private.nix                    # Your personal information
    └── system/
        └── hardware-configuration.nix
```

## System Design

### Flakes

I placed the entire system into a flake as I prefer being able to access everything within a single directory.

### System and User Configurations

The overall system is managed through the configuration.nix file located at /home/redmouse/SystemFiles/system/.
Every user's home.nix configuration file can be managed in a subdirectory of /SystemFiles or kept in their own directory if there is no need for reproducibility.

### DMS and Niri

I chose DMS and Niri as I like having a more keyboard-oriented approach to my workflow and having my system settings within a configuration file that can be moved from system to system without the need for reconfiguration.

## Why NixOS

I have enjoyed using NixOS since I rebuilt my first configuration several years ago.  The depth of the system it allows you to create has only provided me with an ever-increasing drive to learn more about operating systems and programming languages as time goes on.

## Installing NixOS-Public

### Using NixOS-Private
```bash
mkdir ~/system_files

cd ~/system_files

git clone git@github.com:BenjaminSLS/NixOS-Public.git

mv NixOS-Public/ public
```

Follow the instructions on [NixOS-Private](git@github.com:BenjaminSLS/NixOS-Private.git) to continue.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

Copyright (c) 2024-2026 Benjamin (Ben) LaShell
