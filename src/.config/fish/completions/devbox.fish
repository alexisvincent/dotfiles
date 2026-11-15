# Completions for devbox (~/.config/bin/devbox).
complete -c devbox -f

complete -c devbox -n __fish_use_subcommand -a list -d 'List the boxes'
complete -c devbox -n __fish_use_subcommand -a wake -d 'Wake a box and hold it awake'

# devbox wake BOX: the box names, from Sprites (kept for 5 minutes).
complete -c devbox -n '__fish_seen_subcommand_from wake; and test (count (commandline -opc)) -eq 2' \
    -a '(devbox names)' -d Box

# devbox wake BOX ...: how long to hold it, or off/status.
complete -c devbox -n '__fish_seen_subcommand_from wake; and test (count (commandline -opc)) -eq 3' -k \
    -a 'status\t"Show the hold"
off\t"Release the hold"
forever\t"Hold until off"
1d\t"Hold for a day"
4h\t"Hold for 4 hours"
1h\t"Hold for an hour (default)"
30m\t"Hold for 30 minutes"'
