# Aliases: silent replacements, never shown on the command line
type -q bat; and alias cat bat
type -q lsd; and alias ls lsd
alias grep 'grep --color=auto'
alias claude 'claude --allow-dangerously-skip-permissions'
test -x /Applications/Tailscale.app/Contents/MacOS/Tailscale
and alias tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale

# Abbreviations: expand as you type, so history shows the full command
abbr -a p pnpm
abbr -a l 'ls -lah'
abbr -a la 'ls -lAh'
abbr -a ll 'ls -lh'

# kubectl with coloured output: k expands to kubecolor, which completes
# like kubectl
if type -q kubecolor
    function kubecolor --wraps kubectl
        command kubecolor $argv
    end
    abbr -a k kubecolor
end
