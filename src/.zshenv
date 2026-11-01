# zsh only reads this one file from the home folder. The real config is in
# ~/.config/zsh, where ZDOTDIR points every later file (.zprofile, .zshrc).
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source "$ZDOTDIR/.zshenv"
