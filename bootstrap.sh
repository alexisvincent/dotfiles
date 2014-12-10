#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "brew.sh" \
        --exclude "bin/" --exclude "init.sh" --exclude "geektool/" \
		--exclude ".osx" --exclude "config/" \
        --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;