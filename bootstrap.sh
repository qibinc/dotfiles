#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "*.sh" \
        --exclude "README.md" \
        --exclude "LICENSE" \
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

if command -v /bin/zsh &> /dev/null; then
    echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf.local
elif command -v $HOME/.linuxbrew/bin/zsh &> /dev/null; then
    echo "set-option -g default-shell $HOME/.linuxbrew/bin/zsh" >> ~/.tmux.conf.local
fi
