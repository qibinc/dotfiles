#!/usr/bin/env bash

if ! command -v brew; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$($HOME/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi

brew update
brew upgrade

if ! command -v zsh; then
  brew install zsh
fi
if ! command -v htop; then
  brew install htop
fi
