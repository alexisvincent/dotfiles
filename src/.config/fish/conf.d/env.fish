# PATH and environment for every fish, interactive or not, so scripts,
# tools that shell out, and ssh commands all get the same setup.

set -gx XDG_CONFIG_HOME ~/.config
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER 'less -X'
set -gx BUN_INSTALL ~/.bun

if test (uname) = Darwin
    # US English, UTF-8. (The Rex image sets C.UTF-8 and has no other locales.)
    set -gx LANG en_US.UTF-8
    set -gx LC_ALL en_US.UTF-8
    /opt/homebrew/bin/brew shellenv fish | source
    set -gx PNPM_HOME ~/Library/pnpm
    test -f ~/.local/google-cloud-sdk/path.fish.inc; and source ~/.local/google-cloud-sdk/path.fish.inc
else
    set -gx PNPM_HOME ~/.local/share/pnpm
end

# Missing folders are skipped. -m moves entries that are already on PATH,
# so the last line wins: these end up first.
fish_add_path -g -m ~/.cargo/bin $PNPM_HOME $BUN_INSTALL/bin ~/.orbstack/bin
fish_add_path -g -m $REX_BIN_DIR ~/.krew/bin ~/.local/bin

type -q mise; and mise activate fish | source
