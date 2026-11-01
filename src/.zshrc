# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# For zsh-completions
autoload -U compinit && compinit

fpath=( "$HOME/.zfunctions" $fpath )
# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
# ZSH_THEME="lambda"

[[ $EMACS = t ]] && unsetopt zle

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Plugins
plugins=(git-extras macos zsh-syntax-highlighting zsh-autosuggestions wd python vi-mode colorize docker docker-compose zsh-z)

source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa"

# Vi mode normal prompt indicator
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$EPS1"
    zle reset-prompt
    # Set cursor: 2=steady block (normal), 6=steady bar (insert)
    case $KEYMAP in
        vicmd) printf '\e[2 q';;
        *)     printf '\e[6 q';;
    esac
}

source $HOME/.aliases

eval "$(/opt/homebrew/bin/brew shellenv)"


if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

source <(kubectl completion zsh)
complete -F __start_kubectl k

source ~/.private/privaterc

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"


# bun completions
[ -s "/Users/alexisvincent/.bun/_bun" ] && source "/Users/alexisvincent/.bun/_bun"

# export GOOGLE_APPLICATION_CREDENTIALS="$(gcloud auth application-default print-access-token)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

# NVIM Switcher
alias nvim-lazy="NVIM_APPNAME=nvim-lazy nvim"

function nvims() {
  items=("default" "nvim-lazy")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexisvincent/.local/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexisvincent/.local/google-cloud-sdk/completion.zsh.inc'; fi

bindkey -s ^a "nvims\n"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


eval "$(starship init zsh)"




alias claude="claude --allow-dangerously-skip-permissions"



# Composio CLI
export COMPOSIO_INSTALL_DIR=/Users/alexisvincent/.composio
export PATH="/Users/alexisvincent/.composio:$PATH"

# Added by Antigravity
export PATH="/Users/alexisvincent/.antigravity/antigravity/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexisvincent/.lmstudio/bin"
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"

if [ -n "$REX_BIN_DIR" ]; then
    export PATH="$REX_BIN_DIR:$PATH"
fi
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
