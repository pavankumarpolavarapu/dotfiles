#!/usr/bin/env bash
sudo apt-get install -y jq

# Load Sources
chmod +x sources.sh
./sources.sh 

# HTTPS support
sudo apt-get install apt-transport-https

# Update
sudo apt-get update

sudo apt-get install -y $(jq .repositories[] ~/.config.json | tr -d \")
bash -c "$(wget -qO- $(jq .terminal.theme ~/.config.json | tr -d \"))"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k  

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
