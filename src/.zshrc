# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=( "$HOME/.zfunctions" $fpath )
# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
# ZSH_THEME="lambda"

alias kepler="clj -A:kepler-console -X:kepler-console :option"
alias antq="clojure -Sdeps '{:deps {antq/antq {:mvn/version \"RELEASE\"}}}' -m antq.core"
alias p=pnpm
alias set-doom="echo \"doom\" > ~/.emacs-profile"
alias set-spacemacs="echo \"spacemacs\" > ~/.emacs-profile"

[[ $EMACS = t ]] && unsetopt zle

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(git-extras macos zsh-syntax-highlighting zsh-completions brew wd python vi-mode colorize docker docker-compose)

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

eval $(thefuck --alias)

# Fix for vim-instant-markdown
set shell=bash\ -i

# The next line updates PATH for the Google Cloud SDK.
source '/Applications/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Applications/google-cloud-sdk/completion.zsh.inc'

export BOOT_CLOJURE_VERSION=1.9.0
export BOOT_VERSION=2.8.0-SNAPSHOT
export BOOT_JVM_OPTIONS='
	-client
	-XX:+TieredCompilation
	-XX:TieredStopAtLevel=1
	-Xmx2g
	-XX:+CMSClassUnloadingEnabled
	-Xverify:none'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$HOME/.doom.emacs.d/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$(yarn global bin)

# export GOOGLE_APPLICATION_CREDENTIALS=$(gcloud auth application-default print-access-token)
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
