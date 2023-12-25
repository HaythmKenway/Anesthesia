#!/bin/bash
sudo apt update
sudo apt upgrade
cd /dev/shm
sudo snap install postman --classic
sudo snap install discord --classic

# installing go
wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.3.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.bashrc
go version

#installing homebrew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jless
#installing DOcker
sudo apt install gnome-terminal
rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/nulocker
sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.2-amd64.deb
sudo apt install ./docker-desktop-4.24.2-amd64.deb

sudo apt install git -y

# Git Config
read -p -e "\e[35mEnter your Git username: \e[0m" username
read -p -e "\e[35mEnter your Git email: \e[0m" email
git config --global user.name "$username"
git config --global user.email "$email"
echo -e "\e[32mSuccessfully configured GitHub locally \xE2\x9C\x94\e[0m"
ssh-keygen -t ed25519 -C "akileswar2002@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub |xclip -selection clipboard
echo "public key has been copied to your clipboard add it to your ssh keys"
read -n 1 -s -r -p " press enter to continue"
xdg-open https://github.com/settings/keys

git init dotfiles --bare
git --git-dir=$HOME/dotfiles --work-tree=$HOME/ remote add origin git@github.com:HaythmKenway/dotfiles.git
rm ~/.bashrc
git --git-dir=$HOME/dotfiles --work-tree=$HOME/ pull origin dot 

#node version manager
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc
nvm install node # "node" is an alias for the latest version
nvm use node

#usefultools
go install github.com/OJ/gobuster/v3@latest
git clone https://github.com/danielmiessler/SecLists.git
go install github.com/ffuf/ffuf/v2@latest
go install -v github.com/owasp-amass/amass/v4/...@master
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go get -u github.com/tomnomnom/assetfinder
go install github.com/tomnomnom/httprobe@latest
go install -v github.com/tomnomnom/anew@latest
go install github.com/lc/gau/v2/cmd/gau@latest
curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/main/install-nix.sh | bash -s $HOME/.local/bin
#vim

sudo apt install gnome-browser-connector libfuse2 gcc clangd atril -y 
sudo wget -O /usr/bin/nvim https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod 755 /usr/bin/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Mega setup
wget https://mega.nz/linux/repo/xUbuntu_23.04/amd64/megacmd-xUbuntu_23.04_amd64.deb && sudo apt install "$PWD/megacmd-xUbuntu_23.04_amd64.deb"
echo -e "\e[35mEnter your Mega username: \e[0m"
read username
echo -e "\e[35mEnter your Mega Password: \e[0m"
read -s  password
mega-login $username $password 
directory=~/Documents/obsvault
if [ -d "$directory" ]; then
    echo "The directory $directory exists."
else
    echo "The directory $directory does not exist. Creating it..."
    mkdir -p "$directory"
	
    if [ -d "$directory" ]; then
        echo "Directory $directory created successfully."
    else
        echo "Failed to create $directory. Check your permissions or other issues."
    fi
fi

## installing aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

## installing pipx
sudo apt install pipx
pipx install mitmproxy
