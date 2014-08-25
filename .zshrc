# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git gitfast git-flow osx textmate)

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Aliases
source ~/.aliases

# PATH
export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin"

# Homebrew temp
export HOMEBREW_TEMP=/usr/local/homebrew_temp

# Go Path
export GOPATH="$HOME/.go"

# Docker OSX
eval `docker-osx env`