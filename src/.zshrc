# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
# ZSH_THEME="bira"
ZSH_THEME="lambda"

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(git-extras osx zsh-syntax-highlighting zsh-completions brew wd python taskwarrior vi-mode colorize docker docker-compose)

# For zsh-completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Set vi mode switching to 100ms instead of default 400ms
export KEYTIMEOUT=1
# Vi mode normal prompt indicator
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
}

# Aliases
source $HOME/.aliases

# Functions
source $HOME/.functions

eval $(thefuck --alias)

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin/
# envsubst
PATH=$PATH:/usr/local/opt/gettext/bin
# Composer libs
PATH=$PATH:$HOME/.composer/vendor/bin
# Latex
PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin/
# Haskell
PATH=$PATH:$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin/
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.cabal/bin/
PATH=$PATH:$HOME/.yarn/bin/


export PATH=$PATH

# Setup nvm - for node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Fix for vim-instant-markdown
set shell=bash\ -i

# Environment
source $HOME/.env

# Tell gcloud to use macs python
export CLOUDSDK_PYTHON=/usr/bin/python

# The next line updates PATH for the Google Cloud SDK.
source '/Applications/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Applications/google-cloud-sdk/completion.zsh.inc'
