#!/bin/bash

dotfiles=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

cd $dotfiles
rm -rf $dotfiles/trash
mkdir -p $dotfiles/trash

for file in $(ls -A src); do
  mv ~/$file $dotfiles/trash/$file

  echo "Symlink ~/$file -> $dotfiles/src/$file"
  ln -s $dotfiles/src/$file ~/$file
done
