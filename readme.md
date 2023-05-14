



# structure

```bash
dotnix
├── home    #home-manager config
│   └── fede   #home-manager users
│       ├── desktop.nix
│       ├── features
│       │   ├── cli
│       │   │   ├── default.nix
│       │   │   ├── ranger.nix
│       │   │   ├── starship.nix
│       │   │   └── zsh.nix
│       │   ├── desktop  # wm/de config
│       │   │   ├── awesomewm
│       │   │   │   └── default.nix
│       │   │   └── common  # desktop related module
│       │   │       ├── default.nix
│       │   │       ├── discord.nix
│       │   │       ├── firefox.nix
│       │   │       └── font.nix
│       │   └── games    # games module
│       │       ├── default.nix
│       │       ├── lutris.nix
│       │       └── steam.nix
│       └── global
│           └── default.nix
├── hosts    #nixos config
│   ├── common
│   │   ├── global
│   │   │   ├── auto-upgrade.nix
│   │   │   ├── default.nix
│   │   │   ├── locale.nix
│   │   │   ├── steam-hardware.nix
│   │   │   └── zsh.nix
│   │   ├── optional
│   │   │   ├── awesomewm.nix
│   │   │   ├── gamemode.nix
│   │   │   ├── pipewire.nix
│   │   │   └── quietboot.nix
│   │   └── users
│   │       └── fede
│   │           └── default.nix
│   └── desktop
│       ├── default.nix
│       └── hardware-configuration.nix
├── modules    # modules for extending flake.nix
│   ├── home-manager # modules for extending flake.nix
│   │   └── default.nix
│   └── nixos        # modules for extending hosts
│       └── default.nix
├── overlays
│   └── default.nix
├── flake.nix
└── shell.nix

```
