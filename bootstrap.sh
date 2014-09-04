#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "Brewfile" --exclude "Caskfile" \
        --exclude "bin/" --exclude "init/" --exclude "geektool/" \
		--exclude ".osx" \
        --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;