# Ghostty Configuration

This directory contains my Ghostty terminal emulator configuration.

## Config File

The main configuration file is `config`. Ghostty uses a simple key-value format.

Online docs: https://ghostty.org/docs

## CLI Reference

Ghostty has comprehensive built-in documentation via its CLI. Always use these commands to get accurate, version-specific information.

### Configuration Documentation

```bash
# Show ALL config options with full documentation (primary reference)
ghostty +show-config --default --docs

# Show current config (non-default values only)
ghostty +show-config

# Show current config with docs
ghostty +show-config --docs

# Validate config file for errors
ghostty +validate-config
```

### Listing Resources

```bash
# List available fonts
ghostty +list-fonts

# List available themes
ghostty +list-themes

# List available colors
ghostty +list-colors

# List current keybindings
ghostty +list-keybinds

# List all keybind actions (for use in config)
ghostty +list-actions
```

### Other Commands

```bash
# Open config in editor
ghostty +edit-config

# Show version
ghostty +version

# Show font face details
ghostty +show-face

# Show all available actions
ghostty +help
```

### Searching Config Options

To find a specific config option, pipe through grep:

```bash
ghostty +show-config --default --docs | grep -A 20 "font-family"
ghostty +show-config --default --docs | grep -A 20 "keybind"
ghostty +show-config --default --docs | grep -A 20 "window"
```

## Common Keybind Actions

Use `ghostty +list-actions` to see all. Common ones:
- `copy_to_clipboard`, `paste_from_clipboard`
- `new_window`, `new_tab`, `new_split`
- `next_tab`, `previous_tab`, `goto_tab`
- `goto_split`, `resize_split`, `toggle_split_zoom`
- `increase_font_size`, `decrease_font_size`, `reset_font_size`
- `scroll_page_up`, `scroll_page_down`, `scroll_to_top`, `scroll_to_bottom`
- `reload_config`, `open_config`
