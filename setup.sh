#! usr/bin/bash

# fix resolv conf
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
sudo chattr +i /etc/resolv.conf

# add directories
mkdir .config
mkdir documents

# updating system
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get full-upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y

# install starship
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> .bashrc
touch .config/starship.toml
starship preset nerd-font-symbols > ~/.config/starship.toml
source .bashrc

# install nvim
git clone https://github.com/neovim/neovim.git
cd neovim
make
make install

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source .bashrc
nvm install 19

# install package managers
sudo apt install python3-pip
sudo apt install cargo
source .bashrc
