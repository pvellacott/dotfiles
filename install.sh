
# install ghostty
sudo pacman -S ghostty

# Install Curl and Git
sudo pacman -S curl
sudo pacman -S git

# Install Audio GUI
sudo pacman -S pavucontrol

# Install Neovim
sudo pacman -S neovim

# lol
sudo pacman -S fastfetch

# Install ZSH and Oh My ZSH
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install mpv video player
sudo pacman -S mpv

# Wallpaper
#sudo pacman -S feh
sudo pacman -S hyprpaper


# NPM and yarn
sudo pacman -S nodejs npm
sudo npm install -g yarn

# Nerdfont
sudo pacman -S ttf-jetbrains-mono-nerd

# Screenshots
sudo pacman -S grim slurp swappy

# https://github.com/uiriansan/SilentSDDM
cd ~/Documents/Git/ && git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM && cd SilentSDDM && ./install.sh
cp ~/Pictures/Profile/login.png /usr/share/sddm/smoo.face.icon
