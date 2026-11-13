# Alexis’ dotfiles

## Installation

Clone the repository anywhere (I keep it in `~/Code/dotfiles`), then run the bootstrap script. It links everything in `src/` into your home folder. Anything already in the way is moved to `trash/` first, never deleted.

```bash
git clone https://github.com/alexisvincent/dotfiles.git ~/Code/dotfiles
~/Code/dotfiles/bootstrap.sh
```

Run `bootstrap.sh` again after adding a new file to `src/`. Changes to files already linked apply straight away.

### Dependencies

The shell is fish, with Starship for the prompt and zoxide for `z`. The terminal needs a [Nerd Font](https://github.com/ryanoasis/nerd-fonts).

### Private settings

API keys go in `~/.private/secrets` (plain `export NAME=value` lines), which interactive fish reads if present. It's never committed.

### Dev boxes

`install-devbox.sh` sets up a fresh Fly Sprite as a dev box. It installs the 1Password CLI, stores the service-account token, clones the private [devbox](https://github.com/alexisvincent/devbox) repo to `~/Code/devbox` and runs its `bootstrap.sh`, which does the rest (including cloning and linking these dotfiles).

```bash
export DEVBOX_OP_TOKEN=...   # the 1Password service-account token
curl -fsSL https://raw.githubusercontent.com/alexisvincent/dotfiles/master/install-devbox.sh | bash -s <name>
```
