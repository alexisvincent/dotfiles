#!/usr/bin/env bash
# Put the workspace in accordion once AeroSpace has started.
#
# AeroSpace ignores default-root-container-layout for the workspace focused at startup: it forces
# tiles when that workspace has three windows or fewer (nikitabobko/AeroSpace#568). The layout
# command needs a tiling window to act on, and at login there may be none yet, so wait for one.

set -uo pipefail

aerospace=/opt/homebrew/bin/aerospace

for _ in {1..240}; do
  for window in $("$aerospace" list-windows --workspace focused --format '%{window-id}' 2>/dev/null); do
    # Fails on floating windows, so try each window until one takes it.
    if "$aerospace" layout --window-id "$window" accordion 2>/dev/null; then
      exit 0
    fi
  done
  sleep 0.5
done

echo 'No tiling window appeared to set the accordion layout on.' >&2
exit 1
