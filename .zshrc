# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git gitfast git-flow osx textmate laravel4)

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Aliases
source ~/.aliases

# Functions
source ~/.functions

# PATH
export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/.composer/vendor/bin"

# Environment
source $HOME/.env

# Set updated docker-osx IP
eval `docker-osx env`