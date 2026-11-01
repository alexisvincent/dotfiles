# Alexis’ dotfiles

## Installation

Clone the repository anywhere (I keep it in `~/Code/dotfiles`), then run the bootstrap script. It links everything in `src/` into your home folder. Anything already in the way is moved to `trash/` first, never deleted.

```bash
git clone --recurse-submodules https://github.com/alexisvincent/dotfiles.git ~/Code/dotfiles
~/Code/dotfiles/bootstrap.sh
```

Run `bootstrap.sh` again after adding a new file to `src/`. Changes to files already linked apply straight away.

### Dependencies

The zsh plugins (autosuggestions, syntax highlighting, z) are submodules, so `--recurse-submodules` fetches them. No plugin manager.

Starship draws the prompt in zsh and fish. The terminal needs a [Nerd Font](https://github.com/ryanoasis/nerd-fonts).

### Private settings

Secrets and anything personal go in `~/.private/` (`zshenv` and `privaterc`), which the shell configs read if present. It's never committed.
