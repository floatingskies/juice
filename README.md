# 🍹 Juice - The Refreshing Package Manager

[![Version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://github.com/juice-pm/juice)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Made in Brazil](https://img.shields.io/badge/made%20in-Brazil%20🇧🇷-yellow.svg)](https://github.com/juice-pm/juice)

> **A nostalgic yet modern package manager for Arch-based distributions.**
> brewing animations, and a UX that just works.

---

## ✨ Features

- 🐧 **Pacman Integration** - Native Arch package management
- 📦 **Flatpak Support** - Flathub apps made easy
- 🫧 **Snap Packages** - Universal package support
- 🐳 **Distrobox Power** - Containers for Arch, Debian, Ubuntu, Fedora, Kali
- ⚡ **Lightning Fast** - Optimized for speed
- 🫧 **Brewing Animations** - Visual feedback for all operations

## 📦 Installation

### Manual Install

```bash
# Download the script
sudo curl -o /usr/local/bin/juice https://raw.githubusercontent.com/floatingskies/juice/main/juice

# Make executable
sudo chmod +x /usr/local/bin/juice
```

## 🚀 Usage

### Basic Commands

```bash
# Show help
juice help

# Install packages
juice install firefox
juice install neovim git

# Remove packages
juice remove firefox

# Update system
juice update

# Search packages
juice search firefox
```

### Flatpak Commands

```bash
juice flat-install discord
juice flat-remove discord
juice flat-update
juice flat-search vscode
juice flat-list
```

### Snap Commands

```bash
juice snap-install spotify
juice snap-remove spotify
juice snap-update
juice snap-search code
juice snap-list
```

### Distrobox Commands

```bash
# Create containers
juice box-create arch
juice box-create debian
juice box-create ubuntu
juice box-create fedora
juice box-create kali

# Enter container
juice box-enter arch

# Install in container
juice box-install arch neovim

# List containers
juice box-list

# Remove container
juice box-remove arch
```

### Quick Actions

```bash
# Update everything (pacman + flatpak + snap)
juice refresh

# Clean cache and remove orphans
juice clean

# System health check
juice doctor
```

## 🎨 Color-Coded UX

| Color | Meaning |
|-------|---------|
| 🟢 Green | Success, Install, Pacman |
| 🟡 Yellow | Warnings, Prompts, Updates |
| 🔵 Blue | Info, Headers, Flatpak |
| ⚪ White | Normal text, Neutral |
| 🔴 Red | Errors, Remove |
| 🟣 Magenta | Snap packages |
| 🔷 Cyan | Distrobox, Progress |

## 🐧 Supported Distros

- Arch Linux
- CachyOS
- Manjaro
- BigLinux
- EndeavourOS
- Garuda Linux
- ArcoLinux
- Archcraft
- Artix Linux
- Any Arch-based distro!

## 📋 Requirements

- Arch-based Linux distribution
- `pacman` package manager
- `sudo` access (for system operations)

### Optional Dependencies

- `flatpak` - For Flatpak support
- `snapd` - For Snap support
- `distrobox` + `podman` or `docker` - For container support

## 🔧 Configuration

Config directory: `~/.config/juice/`
Cache directory: `~/.cache/juice/`
Log file: `~/.cache/juice/juice.log`

## 📜 License

MIT License - Feel free to use, modify, and distribute!

---

**🍹 Juice - Made with Brazilian passion! 🇧🇷**
