
type -q bat; and alias cat bat
type -q lsd; and alias ls lsd
alias l 'ls -lah'
alias la 'ls -lAh'
alias ll 'ls -lh'
alias grep 'grep --color=auto'
alias p pnpm
alias claude 'claude --allow-dangerously-skip-permissions'
test -x /Applications/Tailscale.app/Contents/MacOS/Tailscale
and alias tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale

# kubectl with coloured output; both complete like kubectl
if type -q kubecolor
    function kubecolor --wraps kubectl
        command kubecolor $argv
    end
    function k --wraps kubectl
        command kubecolor $argv
    end
end
