# Shell behaviour: history, completion and vi mode.

# History: big, shared between open shells, with timestamps
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify share_history

setopt auto_cd auto_pushd pushd_ignore_dups interactive_comments

# Completion: menu, case-insensitive, cached
autoload -Uz compinit && compinit -d ~/.cache/zcompdump
setopt auto_menu complete_in_word always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.cache/zsh

# Vi mode, switching modes after 10ms instead of 400ms
export KEYTIMEOUT=1
bindkey -v
bindkey -M viins '^?' backward-delete-char   # backspace past where insert began
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^w' backward-kill-word
# Up/down search history for lines starting with what's typed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
for keymap in viins vicmd; do
  bindkey -M $keymap '^[[A' up-line-or-beginning-search
  bindkey -M $keymap '^[OA' up-line-or-beginning-search
  bindkey -M $keymap '^[[B' down-line-or-beginning-search
  bindkey -M $keymap '^[OB' down-line-or-beginning-search
done
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
# vv in normal mode: edit the command in nvim
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line
# Block cursor in normal mode, bar in insert mode
function zle-keymap-select zle-line-init {
  case $KEYMAP in
    vicmd) printf '\e[2 q';;
    *)     printf '\e[6 q';;
  esac
}
zle -N zle-keymap-select
zle -N zle-line-init
