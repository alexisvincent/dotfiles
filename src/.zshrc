# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
# ZSH_THEME="bira"
ZSH_THEME="lambda"

[[ $EMACS = t ]] && unsetopt zle

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(git-extras osx zsh-syntax-highlighting emacs yarn zsh-completions brew wd python vi-mode colorize docker docker-compose)

# For zsh-completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Vi mode normal prompt indicator
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
}

source $HOME/.aliases
source $HOME/.functions

eval $(thefuck --alias)

# Fix for vim-instant-markdown
set shell=bash\ -i

# The next line updates PATH for the Google Cloud SDK.
source '/Applications/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Applications/google-cloud-sdk/completion.zsh.inc'
