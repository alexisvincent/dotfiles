#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Create some default dir's
mkdir /usr/local/
#mkdir /usr/local/homebrew_temp
#mkdir $HOME/.go

# Execute bootstrap
sh bootstrap.sh

# Import Terminal Config (You will still need to set it as default)
# open ./config/alexisvincent.terminal

# Install Homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Execute bootstrap
# sh brew.sh

# Set default shell
chsh -s /usr/local/bin/zsh
