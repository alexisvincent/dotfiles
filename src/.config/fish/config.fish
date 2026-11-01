if status is-interactive
    # No "Welcome to fish" message on startup
    set -g fish_greeting

    # Prompt
    if type -q starship
        starship init fish | source
    end
end
