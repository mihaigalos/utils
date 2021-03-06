#!/bin/bash

function setup_oh_my_zsh() {
    
    sudo apt update
    sudo apt -y install zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sed -i -e 's/ZSH_THEME.*/ZSH_THEME="af-magic-time"/' ~/.zshrc

    wget https://gist.githubusercontent.com/mihaigalos/bde132c03ba2ae6a5f4d5c0cfedbcd61/raw/8c3dff083b3141b1ee202d93d2cb4df2aff28d6b/af-magic-time.zsh-theme -O ~/.oh-my-zsh/themes/af-magic-time.zsh-theme

    cat << EOF >> ~/.zshrc
HISTFILE=~/.zsh_history
HISTSIZE=9999999
SAVEHIST=$HISTSIZE

export EDITOR=vim
export LC_ALL="en_US.UTF-8"

[ -x "\$(command -v kubectl)" ] && alias k='kubectl'
[ -x "\$(command -v exa)" ] && alias l='exa -all'

function cd {
    builtin cd "\$@" && l
}

EOF
}

setup_oh_my_zsh

