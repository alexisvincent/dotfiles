# This file needs to be really quick, since, for some completely wacked
# reason, evil evaluates it everytime you run dd or something similar

# Make emacs the default editor.
export EDITOR='emacsclient -c'

# Set vi mode switching to 100ms instead of default 400ms
export KEYTIMEOUT=1

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.npm-global/bin
PATH=$PATH:$HOME/.go/bin
PATH=$PATH:$HOME/opt/metasploit-framework/bin


# envsubst
PATH=$PATH:/usr/local/opt/gettext/bin
# Composer libs
PATH=$PATH:$HOME/.composer/vendor/bin
# Latex
PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/
# Haskell
# PATH=$PATH:$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin/
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.cabal/bin/
PATH=$PATH:$HOME/.nvm/versions/node/v7.3.0/bin

PATH=$PATH:$HOME/.krew/bin

export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools

# include graalvm utils in path
PATH=$PATH:$(/usr/libexec/java_home -v 11)/bin

export TELEPRESENCE_ROOT=/tmp/tel_root
export PATH=$PATH

export NPM_CONFIG_PREFIX=$HOME/.npm-global

# Setup nvm - for node too slow :( so I've set it manually
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# nvm use --silent default


# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

# Homebrew temp
export HOMEBREW_TEMP=/usr/local/homebrew_temp

# Go Path
export GOPATH=$HOME/.go

# Stop tmux renameing windows
DISABLE_AUTO_TITLE=true

#Android Development
export ANDROID_HOME=/usr/local/opt/android-sdk

# Use Java 8 by default
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
