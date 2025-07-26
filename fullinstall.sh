#!/bin/bash

# Define variables
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # Get the directory of the script
CONFIG_DIR="$HOME/.config"
OLD_DOTFILES_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d%H%M%S)" # Backup directory

# Function to print output
print_status() {
    echo "[INFO] $1"
}

print_warning() {
    echo "[WARNING] $1"
}

print_error() {
    echo "[ERROR] $1"
}

print_header() {
    echo "=== $1 ==="
}

# Function to create backup
create_backup() {
    if [ -d "$CONFIG_DIR" ]; then
        print_status "Creating backup of existing configs..."
        mkdir -p "$OLD_DOTFILES_DIR"
        cp -r "$CONFIG_DIR" "$OLD_DOTFILES_DIR/"
        print_status "Backup created at: $OLD_DOTFILES_DIR"
    fi
}

# Function to create symlink
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        print_warning "Removing existing symlink: $target"
        rm "$target"
    elif [ -d "$target" ] || [ -f "$target" ]; then
        print_warning "Backing up existing config: $target"
        mv "$target" "$target.backup.$(date +%Y%m%d%H%M%S)"
    fi
    
    print_status "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Function to install packages
install_packages() {
    print_header "Installing packages"
    
    # Core packages
    print_status "Installing core packages..."
    sudo pacman -S --noconfirm curl git zsh neovim mpv npm
    
    # Terminal and fonts
    print_status "Installing terminal and fonts..."
    sudo pacman -S --noconfirm ghostty ttf-jetbrains-mono-nerd
    
    # Audio
    print_status "Installing audio tools..."
    sudo pacman -S --noconfirm pavucontrol
    
    # Screenshots
    print_status "Installing screenshot tools..."
    sudo pacman -S --noconfirm grim slurp swappy
    
    # Fastfetch
    print_status "Installing fastfetch..."
    sudo pacman -S --noconfirm fastfetch
    
}

# Function to install Hyprland packages
install_hyprland_packages() {
    print_header "Installing Hyprland packages"
    sudo pacman -S --noconfirm hyprland hyprpaper waybar
}

# Function to install i3 packages
install_i3_packages() {
    print_header "Installing i3 packages"
    sudo pacman -S --noconfirm i3-wm i3status picom
}

# Function to setup common configs
setup_common_configs() {
    # Create .config directory if it doesn't exist
    mkdir -p "$CONFIG_DIR"
    
    # Symlink common configs
    create_symlink "$DOTFILES_DIR/.config/ghostty" "$CONFIG_DIR/ghostty"
    create_symlink "$DOTFILES_DIR/.config/fastfetch" "$CONFIG_DIR/fastfetch"
    create_symlink "$DOTFILES_DIR/.config/vim" "$CONFIG_DIR/vim"
}

# Function to setup Hyprland configs
setup_hyprland_configs() {
    print_header "Setting up Hyprland configurations"
    
    # Setup common configs first
    setup_common_configs
    
    # Symlink Hyprland-specific configs
    create_symlink "$DOTFILES_DIR/.config/hypr" "$CONFIG_DIR/hypr"
    create_symlink "$DOTFILES_DIR/.config/waybar" "$CONFIG_DIR/waybar"
    
    # Copy wallpaper to Pictures/Wallpaper directory
    print_status "Setting up wallpaper..."
    mkdir -p "$HOME/Pictures/Wallpaper"
    if [ -f "$DOTFILES_DIR/wallpaper/leaves.jpg" ]; then
        cp "$DOTFILES_DIR/wallpaper/leaves.jpg" "$HOME/Pictures/Wallpaper/"
        print_status "Wallpaper copied to: $HOME/Pictures/Wallpaper/leaves.jpg"
    fi
}

# Function to setup i3 configs
setup_i3_configs() {
    print_header "Setting up i3 configurations"
    
    # Setup common configs first
    setup_common_configs
    
    # Symlink i3-specific configs
    create_symlink "$DOTFILES_DIR/.config/i3" "$CONFIG_DIR/i3"
    create_symlink "$DOTFILES_DIR/.config/i3status" "$CONFIG_DIR/i3status"
    create_symlink "$DOTFILES_DIR/.config/picom" "$CONFIG_DIR/picom"
}

# Function to setup minimal configs (no DE)
setup_minimal_configs() {
    print_header "Setting up minimal configurations"
    
    # Setup common configs
    setup_common_configs
}

# Function to setup zsh
setup_zsh() {
    print_header "Setting up ZSH"
    
    # Install Oh My Zsh if not already installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_status "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    else
        print_status "Oh My Zsh already installed"
    fi
    
    # Symlink zsh config
    if [ -d "$DOTFILES_DIR/zsh" ]; then
        create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    fi
}

# Main installation function
main() {
    print_header "Dotfiles Installation"
    print_status "Starting installation from: $DOTFILES_DIR"
    
    # Create backup
    create_backup
    
    # Install core packages
    install_packages
    
    # Prompt for desktop environment choice
    echo
    print_header "Desktop Environment Selection"
    echo "Please choose your desktop environment:"
    echo "1) Hyprland"
    echo "2) i3"
    echo "3) None (minimal setup)"
    echo
    read -p "Enter your choice (1-3): " de_choice
    
    case $de_choice in
        1)
            print_status "Selected: Hyprland"
            install_hyprland_packages
            setup_hyprland_configs
            ;;
        2)
            print_status "Selected: i3"
            install_i3_packages
            setup_i3_configs
            ;;
        3)
            print_status "Selected: Minimal setup"
            setup_minimal_configs
            ;;
        *)
            print_error "Invalid choice. Exiting."
            exit 1
            ;;
    esac
    
    # Setup zsh
    setup_zsh
    
    print_header "Installation Complete."
    print_status "Your dotfiles have been installed successfully."
    print_status "Existing configs backed up to: $OLD_DOTFILES_DIR"
    echo
    print_warning "pls log out now"
}

main "$@"
