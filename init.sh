#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Create some default dir's
mkdir /usr/local/homebrew_temp
mkdir $HOME/.go

# Execute bootstrap
sh bootstrap.sh
