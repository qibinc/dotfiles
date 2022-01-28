#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "*.sh" \
        --exclude "README.md" \
        --exclude "LICENSE.txt" \
        -avh --no-perms . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt

if command -v /bin/zsh; then
    echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf.local
elif command -v $HOME/.linuxbrew/bin/zsh; then
    echo "set-option -g default-shell $HOME/.linuxbrew/bin/zsh" >> ~/.tmux.conf.local
fi

if command -v exa; then
    echo "alias ls=\"exa\"" >> ~/.profile
    echo "alias l=\"exa -l\"" >> ~/.profile
fi

if command -v bat; then
    echo "alias cat=\"bat -pp\"" >> ~/.profile
    echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" >> ~/.profile
fi

source ~/.bash_profile
source ~/.profile
