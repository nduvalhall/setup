#! usr/bin/bash

echo "Updating System"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get full-upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y

echo "Adding Directories"
mkdir documents
mkdir .config

echo "Installing Starship"
curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
touch .config/starship.toml
starship preset nerd-font-symbols > ~/.config/starship.toml

echo "Installing Nvim"
sudo apt install fuse
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
