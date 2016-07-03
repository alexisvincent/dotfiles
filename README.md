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

### Install Dependencies
```bash
# Download oh-my-zsh (It will update itself)
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Download Dein Plugin Manager (It will manage itself)
git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/repos/github.com/Shougo/dein.vim

# Install YouCompleteMe
rm -rf .vim/bundle/repos/github.com/Valloric/YouCompleteMe
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ".vim/bundle/repos/github.com/Valloric/YouCompleteMe"
cd .vim/bundle/repos/github.com/Valloric/YouCompleteMe
./install.py --clang-completer --tern-completer

```

### Install Font
Find your font at https://github.com/ryanoasis/nerd-fonts and download

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
