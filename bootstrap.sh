#!/bin/bash
# Links every entry in src/ into the home folder.
#
# Entries that are already the right link are skipped. Anything else in the
# way (a real file, or a link pointing somewhere else) is moved into
# trash/<date-time>/ first. Nothing in trash/ is ever deleted by this script.
set -euo pipefail
shopt -s dotglob nullglob

dotfiles=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
backup="$dotfiles/trash/$(date +%Y%m%d-%H%M%S)"

for target in "$dotfiles"/src/*; do
  file=${target##*/}
  link="$HOME/$file"

  if [ -L "$link" ] && [ "$(readlink "$link")" = "$target" ]; then
    continue
  fi

  if [ -e "$link" ] || [ -L "$link" ]; then
    mkdir -p "$backup"
    mv "$link" "$backup/$file"
    echo "Moved old ~/$file to ${backup#"$dotfiles"/}/$file"
  fi

  echo "Symlink ~/$file -> $target"
  ln -s "$target" "$link"
done
