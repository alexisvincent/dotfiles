#!/usr/bin/env bash
# Go back to the previous window, or to another app's window if AeroSpace has no previous one.
#
# Usage: focus-previous.sh <bundle-id-to-leave> <bundle-id-to-prefer>
#
# focus-back-and-forth remembers a single window and fails if that window has closed. AeroSpace
# doesn't report when a window was last focused, so in that case pick a window of the preferred
# app, or failing that any window of an app other than the one being left.

set -uo pipefail

aerospace=/opt/homebrew/bin/aerospace
leave_bundle_id=${1:?usage: focus-previous.sh <bundle-id-to-leave> <bundle-id-to-prefer>}
prefer_bundle_id=${2:?usage: focus-previous.sh <bundle-id-to-leave> <bundle-id-to-prefer>}

"$aerospace" focus-back-and-forth 2>/dev/null && exit 0

window=$("$aerospace" list-windows --all --format '%{window-id} %{app-bundle-id}' \
  | awk -v leave="$leave_bundle_id" -v prefer="$prefer_bundle_id" '
      $2 == prefer { print $1; found = 1; exit }
      $2 != leave && other == "" { other = $1 }
      END { if (!found && other != "") print other }')

if [ -z "$window" ]; then
  echo 'No other window to focus.' >&2
  exit 1
fi

exec "$aerospace" focus --window-id "$window"
