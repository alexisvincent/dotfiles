# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh_custom
ZSH_THEME="bira"

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Plugins
plugins=(gitfast osx textmate brew wd)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases

# Functions
source $HOME/.functions

# PATH
export PATH="/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/.composer/vendor/bin"

# Environment
source $HOME/.env