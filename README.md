# Alexis’ dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want (I like to keep it in `~/.dotfiles`). The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
cd ~
git clone https://github.com/alexisvincent/dotfiles.git .dotfiles
cd .dotfiles
source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Alexis Vincent"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="alexis@alexisvincent.io"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/alexisvincent/dotfiles/fork) instead, though.


### Install Homebrew formulae

Install [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):
```bash
./brew.sh
```
