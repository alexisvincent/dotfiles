if status is-interactive
    # Prompt
    if type -q starship
        starship init fish | source
    end
end
