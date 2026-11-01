# Read by every zsh, including scripts, so keep it quick.

export EDITOR='nvim'

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.krew/bin

# pnpm
export PNPM_HOME="/Users/alexisvincent/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexisvincent/.local/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexisvincent/.local/google-cloud-sdk/path.zsh.inc'; fi

export PATH=$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'


. "$HOME/.cargo/env"

eval "$(mise activate zsh)"

# Private settings (AWS profile etc.), kept out of the public repo.
[ -f ~/.private/zshenv ] && source ~/.private/zshenv
