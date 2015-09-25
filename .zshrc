# oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh_custom
ZSH_THEME="bira"

# Disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Plugins
plugins=(gitfast git-extras osx textmate brew wd lol npm python)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases

# Functions
source $HOME/.functions

# PATH
export PATH="/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/.composer/vendor/bin"

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Fix for vim-instant-markdown
set shell=bash\ -i

# Environment
source $HOME/.env
