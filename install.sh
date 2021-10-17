# Install Curl and Git
sudo apt-get install curl
sudo apt-get install git

# Install Python
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install python-apt

# Install JDK
sudo apt-get install default-jdk

# Install Neovim
sudo apt-get install neovim

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

#Install TMUX
sudo apt-get isntall tmux

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

# Setup VIM Config
rm -rf "$HOME/.vimrc"
ln -s "$DEV/dotfiles/vim/.vimrc" "$HOME/.vimrc"
