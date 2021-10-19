# Install Curl and Git
sudo apt-get install curl
sudo apt-get install git

# Install JDK
sudo apt-get install default-jdk

# Install Neovim
sudo apt-get install neovim

# LOL
sudo apt-get install neofetch

# Install ZSH and Oh My ZSH
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install mpv
sudo apt-get install mpv

# Install ledger
sudo apt-get install ledger

# Install Spotify
sudo apt-get install spotify-client

# Install Spotify cli Interface
sudo pip install spotify-cli-linux

# Install TMUX
sudo apt-get install tmux

# Install Arc Theme
sudo apt-get install arc-theme

# Install Icon Theme
sudo apt-get install papirus-icon-theme

# Install Window Tiling Extension
sudo apt install node-typescript make git
git clone https://github.com/pop-os/shell
cd shell
make local-install

# NPM and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install node
nvm use node
nvm install --lts
nvm use --lts
npm install -g yarn
npm install -g gh-pages

# Setup ZSH Config
rm "$HOME/.zshrc"
ln -s "$DEV/dotfiles/.zshrc" "$HOME/.zshrc"

# Setup NVIM Config
rm -rf "$HOME/.config/nvim"
ln -s "$DEV/dotfiles/vim/init.vim" "$HOME/.config/nvim"
