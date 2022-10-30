#! usr/bin/bash
cd ..

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
y
echo 'eval "$(starship init bash)"' >> .bashrc
touch .config/starship.toml
starship preset nerd-font-symbols > ~/.config/starship.toml

echo "Installing Nvim"
sudo apt install fuse
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
echo 'alias nv="nvim"' >> .bashrc

echo "Installing Exa"
sudo apt install exa
echo "
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'" >> .bashrc
