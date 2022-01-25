#!/usr/bin/env bash

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$($HOME/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile
eval "$($HOME/.linuxbrew/bin/brew shellenv)"

brew update
brew upgrade

brew install zsh
brew install bat
brew install dust
brew install duf
brew install fd
brew install ripgrep
brew install jq
brew install tldr
brew install hyperfine
