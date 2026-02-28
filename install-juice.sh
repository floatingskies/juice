#!/usr/bin/env bash
#
#  🍹 Juice Package Manager - Easy Installer
#  🇧🇷 Brazilian-powered installation script!
#
#  Usage: curl -fsSL https://juice.pm/install | bash
#         OR: wget -qO- https://juice.pm/install | bash
#

set -euo pipefail

# Colors - Brazilian Flag! 🇧🇷
GREEN='\033[38;5;34m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;25m'
RED='\033[38;5;196m'
BOLD='\033[1m'
RESET='\033[0m'

INSTALL_DIR="/usr/local/bin"
JUICE_URL="https://raw.githubusercontent.com/juice-pm/juice/main/juice"
LOCAL_INSTALL="${LOCAL_INSTALL:-false}"

echo -e "${GREEN}${BOLD}"
cat << 'EOF'
  ██████╗ ██╗   ██╗██╗██╗     ██████╗  ██████╗ ███████╗
  ██╔══██╗██║   ██║██║██║     ██╔══██╗██╔════╝ ██╔════╝
  ██║  ██║██║   ██║██║██║     ██║  ██║██║  ███╗█████╗  
  ██║  ██║██║   ██║██║██║     ██║  ██║██║   ██║██╔══╝  
  ██████╔╝╚██████╔╝██║███████╗██████╔╝╚██████╔╝███████╗
  ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚══════╝
EOF
echo -e "${YELLOW}${BOLD}  🍹 Installer v1.0 • The Refreshing Package Manager${RESET}"
echo ""

# Check for Arch-based system
check_arch() {
    if [[ ! -f /etc/os-release ]]; then
        echo -e "${RED}❌ Cannot detect OS!${RESET}"
        exit 1
    fi
    
    source /etc/os-release
    
    # List of supported Arch-based distros
    local arch_distros=("arch" "cachyos" "manjaro" "biglinux" "endeavouros" "garuda" "arcolinux" "archcraft" "artix")
    
    local is_arch=false
    for distro in "${arch_distros[@]}"; do
        if [[ "${ID,,}" == "$distro" ]] || [[ "${ID_LIKE,,}" == *"arch"* ]]; then
            is_arch=true
            break
        fi
    done
    
    if [[ "$is_arch" == false ]]; then
        echo -e "${YELLOW}⚠️  Warning: ${PRETTY_NAME} may not be Arch-based${RESET}"
        echo -e "${YELLOW}   Juice is designed for Arch-based distributions${RESET}"
        echo ""
        echo -e "${CYAN}   Continue anyway? [y/N]${RESET}"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    echo -e "${GREEN}✓ Detected: ${PRETTY_NAME}${RESET}"
}

# Check for root/sudo
check_root() {
    if [[ $EUID -ne 0 ]]; then
        if command -v sudo &>/dev/null; then
            echo -e "${YELLOW}📝 Running with sudo...${RESET}"
            exec sudo "$0" "$@"
        else
            echo -e "${RED}❌ This script requires root privileges${RESET}"
            echo -e "${YELLOW}   Please run with: sudo $0${RESET}"
            exit 1
        fi
    fi
}

# Install dependencies
install_deps() {
    echo -e "${BLUE}📦 Checking dependencies...${RESET}"
    
    local deps=("curl" "wget" "git")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            missing+=("$dep")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        echo -e "${YELLOW}   Installing: ${missing[*]}${RESET}"
        pacman -S --noconfirm "${missing[@]}" >/dev/null 2>&1
    fi
    
    echo -e "${GREEN}✓ Dependencies satisfied${RESET}"
}

# Install Juice
install_juice() {
    echo ""
    echo -e "${GREEN}${BOLD}🚀 Installing Juice...${RESET}"
    echo ""
    
    # Create temp file
    local tmp_file
    tmp_file=$(mktemp)
    
    # Download or copy Juice
    if [[ "$LOCAL_INSTALL" == "true" ]] && [[ -f "./juice" ]]; then
        echo -e "${CYAN}   Installing from local file...${RESET}"
        cp "./juice" "$tmp_file"
    else
        echo -e "${CYAN}   Downloading from repository...${RESET}"
        if command -v curl &>/dev/null; then
            curl -fsSL "$JUICE_URL" -o "$tmp_file" 2>/dev/null || {
                # Fallback to local if download fails
                echo -e "${YELLOW}   Download unavailable, using bundled version${RESET}"
                create_bundled_juice "$tmp_file"
            }
        elif command -v wget &>/dev/null; then
            wget -q "$JUICE_URL" -O "$tmp_file" 2>/dev/null || {
                echo -e "${YELLOW}   Download unavailable, using bundled version${RESET}"
                create_bundled_juice "$tmp_file"
            }
        fi
    fi
    
    # Make executable and install
    chmod +x "$tmp_file"
    mv "$tmp_file" "${INSTALL_DIR}/juice"
    
    echo ""
    echo -e "${GREEN}✓ Juice installed to ${INSTALL_DIR}/juice${RESET}"
}

# Create bundled version (fallback)
create_bundled_juice() {
    local target="$1"
    
    # This would contain the full juice script
    # For now, we'll copy from local if available
    if [[ -f "./juice" ]]; then
        cp "./juice" "$target"
    else
        echo -e "${RED}❌ No Juice source available!${RESET}"
        exit 1
    fi
}

# Setup shell completions
setup_completions() {
    echo ""
    echo -e "${BLUE}🔧 Setting up shell completions...${RESET}"
    
    # Bash completion
    local bash_completion="/usr/share/bash-completion/completions/juice"
    mkdir -p "$(dirname "$bash_completion")"
    
    cat > "$bash_completion" << 'COMPLETION'
# Juice bash completion
_juice_completion() {
    local cur prev words cword
    _init_completion || return
    
    local commands=(
        "install" "remove" "update" "search" "info" "list"
        "flat-install" "flat-remove" "flat-update" "flat-search" "flat-list"
        "snap-install" "snap-remove" "snap-update" "snap-search" "snap-list"
        "box-create" "box-enter" "box-list" "box-remove" "box-install"
        "refresh" "clean" "doctor" "help" "version"
    )
    
    if [[ ${cword} -eq 1 ]]; then
        COMPREPLY=($(compgen -W "${commands[*]}" -- "${cur}"))
    fi
}
complete -F _juice_completion juice
COMPLETION
    
    echo -e "${GREEN}✓ Bash completions installed${RESET}"
}

# Setup optional dependencies
setup_optional() {
    echo ""
    echo -e "${BLUE}📦 Checking optional dependencies...${RESET}"
    
    # Check for AUR helper
    if ! command -v yay &>/dev/null && ! command -v paru &>/dev/null; then
        echo -e "${YELLOW}   💡 Tip: Install an AUR helper (yay/paru) for AUR support${RESET}"
    fi
    
    # Check for flatpak
    if ! command -v flatpak &>/dev/null; then
        echo -e "${YELLOW}   💡 Flatpak not installed${RESET}"
        echo -e "${CYAN}      Install with: ${GREEN}juice install flatpak${RESET}"
    fi
    
    # Check for distrobox
    if ! command -v distrobox &>/dev/null; then
        echo -e "${YELLOW}   💡 Distrobox not installed${RESET}"
        echo -e "${CYAN}      Install with: ${GREEN}juice install distrobox podman${RESET}"
    fi
}

# Show success message
show_success() {
    echo ""
    echo -e "${GREEN}${BOLD}"
    echo "  ╭──────────────────────────────────────────────╮"
    echo "  │      🎉 Juice installed successfully! 🎉     │"
    echo "  ╰──────────────────────────────────────────────╯"
    echo -e "${RESET}"
    
    echo -e "${WHITE}  Get started:${RESET}"
    echo -e "    ${GREEN}juice help${RESET}          ${DIM}# Show all commands${RESET}"
    echo -e "    ${GREEN}juice install firefox${RESET} ${DIM}# Install a package${RESET}"
    echo -e "    ${GREEN}juice update${RESET}        ${DIM}# Update your system${RESET}"
    echo -e "    ${GREEN}juice doctor${RESET}        ${DIM}# System health check${RESET}"
    echo ""
    echo -e "${YELLOW}  Quick actions:${RESET}"
    echo -e "    ${GREEN}juice refresh${RESET}       ${DIM}# Update everything (pacman + flatpak + snap)${RESET}"
    echo -e "    ${GREEN}juice clean${RESET}         ${DIM}# Clean cache and orphans${RESET}"
    echo ""
    echo -e "${BLUE}  🇧🇷 Made with Brazilian passion!${RESET}"
    echo ""
}

# Main installation flow
main() {
    echo -e "${BLUE}════════════════════════════════════════════════${RESET}"
    echo ""
    
    check_arch
    check_root "$@"
    install_deps
    install_juice
    setup_completions
    setup_optional
    show_success
}

# Run main
main "$@"
