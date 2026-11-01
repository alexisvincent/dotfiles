# Environment and PATH: conf.d/env.fish (loaded first, for every fish).
status is-interactive; or return

set -g fish_greeting

source $__fish_config_dir/aliases.fish

# API keys, only for interactive shells
test -f ~/.private/privaterc; and source ~/.private/privaterc

# Vi mode: block cursor in normal mode, bar in insert mode. Force the
# cursor shape in every terminal, and reset it for programs like nvim.
fish_vi_key_bindings
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_replace underscore
set -g fish_cursor_visual block
set -g fish_cursor_external line
set -g fish_vi_force_cursor 1
# Ctrl-V: edit the command in nvim
bind -M default ctrl-v edit_command_buffer
bind -M insert ctrl-v edit_command_buffer

# Completions that tools generate themselves, written once and loaded on
# first use. Delete ~/.cache/fish/tool_completions to refresh them.
set -l tool_completions ~/.cache/fish/tool_completions
mkdir -p $tool_completions
set -p fish_complete_path $tool_completions
for tool in kubectl docker
    if type -q $tool; and not test -s $tool_completions/$tool.fish
        $tool completion fish >$tool_completions/$tool.fish
    end
end
if type -q jj; and not test -s $tool_completions/jj.fish
    COMPLETE=fish jj >$tool_completions/jj.fish
end

type -q fzf; and fzf --fish 2>/dev/null | source
# History search on Ctrl-R (after fzf, so it takes Ctrl-R). Up arrow
# stays fish's own prefix search.
type -q atuin; and atuin init fish --disable-up-arrow | source
type -q direnv; and direnv hook fish | source
if type -q zoxide
    zoxide init fish --cmd z | source
else
    function z --description 'Needs zoxide'
        echo "z needs zoxide: brew install zoxide (macOS) or apt install zoxide (Ubuntu)" >&2
        return 1
    end
end
type -q starship; and starship init fish | source
