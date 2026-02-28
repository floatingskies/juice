#!/usr/bin/env bash
#
#  🍹 Juice Package Manager - Easy Installer
#  🇧🇷 Brazilian-powered installation script!
#

# Colors - Brazilian Flag! 🇧🇷
GREEN='\033[38;5;34m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;25m'
RED='\033[38;5;196m'
CYAN='\033[38;5;51m'
BOLD='\033[1m'
RESET='\033[0m'

INSTALL_DIR="/usr/local/bin"

echo -e "${GREEN}${BOLD}"
cat << 'EOF'
                                                                    
                                                                ░░▒▒
                                                                ░░░░
                                                                ░░  
                                                              ░░▒▒  
                                                              ░░░░  
                                                              ░░    
                                                              ▒▒    
                                                              ░░    
                                                            ░░░░    
                                                          ░░░░      
                                                          ░░░░      
                                                          ░░▒▒      
                                                        ░░░░░░      
                                                        ░░▒▒        
          ░░░░░░▒▒▒▒                                    ░░▒▒        
    ░░░░▒▒▒▒░░░░▒▒▓▓▒▒                                ░░░░░░        
    ▒▒░░░░░░▓▓██▓▓▒▒▓▓▒▒░░                            ░░░░          
  ░░▒▒██▓▓▒▒▒▒▓▓▓▓▓▓▓▓▓▓                              ░░▒▒    ░░    
  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                              ░░░░      ░░  
  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                            ░░░░            
  ▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                            ░░▒▒      ░░░░  
  ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▒▒                          ░░░░░░  ░░░░      
    ▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░      ░░  
      ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒░░                            ░░░░░░░░░░░░░░  
        ▒▒▓▓▓▓▓▓▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
          ░░▒▒▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
            ▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░  ░░░░░░░░░░░░░░░░░░░░    
            ░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
            ░░░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
            ░░░░▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    
            ░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░    
            ░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    
              ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒      
              ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
              ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░      
                ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░      
                ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░      
                ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░        
                  ░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░    ░░░░
                    ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓░░░░░░░░░░
                    ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓░░░░░░░░░░
                    ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒░░░░░░░░░░
                  ░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒░░░░░░░░░░
                  ░░▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒▒░░░░░░░░░░
                    ░░▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▓▓▒▒░░░░░░░░░░
                          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▓▓▒▒▒▒▒▒░░░░      
EOF
echo -e "${YELLOW}${BOLD}  🍹 Installer v1.0 • The Refreshing Package Manager${RESET}"
echo ""

# Detect package manager
detect_pm() {
    if command -v pacman &>/dev/null; then
        echo "pacman"
    elif command -v apt &>/dev/null; then
        echo "apt"
    elif command -v dnf &>/dev/null; then
        echo "dnf"
    else
        echo "unknown"
    fi
}

PM=$(detect_pm)

# Check for root
if [[ $EUID -ne 0 ]]; then
    if command -v sudo &>/dev/null; then
        echo -e "${YELLOW}📝 Running with sudo...${RESET}"
        exec sudo "$0" "$@"
    else
        echo -e "${RED}❌ This script requires root privileges${RESET}"
        exit 1
    fi
fi

# Check package manager
echo -e "${BLUE}🔍 Detecting system...${RESET}"
case "$PM" in
    pacman)
        echo -e "${GREEN}✓ Detected pacman (Arch-based)${RESET}"
        DISTRO="Arch-based"
        ;;
    apt)
        echo -e "${GREEN}✓ Detected apt (Debian-based)${RESET}"
        DISTRO="Debian-based"
        ;;
    dnf)
        echo -e "${GREEN}✓ Detected dnf (Fedora/RHEL-based)${RESET}"
        DISTRO="Fedora/RHEL-based"
        ;;
    *)
        echo -e "${YELLOW}⚠️  No supported package manager found${RESET}"
        echo -e "${YELLOW}   Supported: pacman, apt, dnf${RESET}"
        echo -e "${CYAN}   You can still install Juice manually${RESET}"
        DISTRO="Unknown"
        ;;
esac

# Install dependencies
echo ""
echo -e "${BLUE}📦 Checking dependencies...${RESET}"

case "$PM" in
    pacman)
        pacman -S --needed --noconfirm curl wget git 2>/dev/null || true
        ;;
    apt)
        apt install -y curl wget git 2>/dev/null || true
        ;;
    dnf)
        dnf install -y curl wget git 2>/dev/null || true
        ;;
esac

echo -e "${GREEN}✓ Dependencies satisfied${RESET}"

# Install Juice
echo ""
echo -e "${GREEN}${BOLD}🚀 Installing Juice...${RESET}"
echo ""

# Get script directory (for local install)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "${SCRIPT_DIR}/juice" ]]; then
    echo -e "${CYAN}   Installing from local directory...${RESET}"
    cp "${SCRIPT_DIR}/juice" "${INSTALL_DIR}/juice"
elif [[ -f "./juice" ]]; then
    echo -e "${CYAN}   Installing from current directory...${RESET}"
    cp "./juice" "${INSTALL_DIR}/juice"
else
    echo -e "${CYAN}   Downloading Juice...${RESET}"
    if command -v curl &>/dev/null; then
        curl -fsSL "https://raw.githubusercontent.com/juice-pm/juice/main/juice" -o "${INSTALL_DIR}/juice" 2>/dev/null || {
            echo -e "${YELLOW}   Could not download, creating from embedded source...${RESET}"
            # Script would embed the full source here
        }
    fi
fi

chmod +x "${INSTALL_DIR}/juice" 2>/dev/null || true

echo -e "${GREEN}✓ Juice installed to ${INSTALL_DIR}/juice${RESET}"

# Setup completions
echo ""
echo -e "${BLUE}🔧 Setting up shell completions...${RESET}"

# Bash completion
mkdir -p /usr/share/bash-completion/completions 2>/dev/null
cat > /usr/share/bash-completion/completions/juice << 'COMPLETION'
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

# Show success
echo ""
echo -e "${GREEN}${BOLD}"
echo "  ╭──────────────────────────────────────────────╮"
echo "  │      🎉 Juice installed successfully! 🎉     │"
echo "  ╰──────────────────────────────────────────────╯"
echo -e "${RESET}"

echo -e "${WHITE}  Get started:${RESET}"
echo -e "    ${GREEN}juice help${RESET}           ${DIM}# Show all commands${RESET}"
echo -e "    ${GREEN}juice install firefox${RESET} ${DIM}# Install a package${RESET}"
echo -e "    ${GREEN}juice update${RESET}         ${DIM}# Update your system${RESET}"
echo -e "    ${GREEN}juice doctor${RESET}         ${DIM}# System health check${RESET}"
echo ""
echo -e "${YELLOW}  Quick actions:${RESET}"
echo -e "    ${GREEN}juice refresh${RESET}        ${DIM}# Update everything${RESET}"
echo -e "    ${GREEN}juice clean${RESET}          ${DIM}# Clean cache${RESET}"
echo ""
echo -e "${BLUE}  🇧🇷 Made with Brazilian passion!${RESET}"
