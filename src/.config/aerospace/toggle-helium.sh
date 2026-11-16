#!/usr/bin/env bash
# Toggle Helium: start it if it isn't running and focus its window.
# Press again while Helium is focused to go back to the previous window.

set -euo pipefail

aerospace=/opt/homebrew/bin/aerospace
jq=/opt/homebrew/bin/jq
helium_bundle_id=net.imput.helium

helium_window_id() {
  "$aerospace" list-windows --all --format '%{window-id} %{app-bundle-id}' --json \
    | "$jq" -r --arg bundle_id "$helium_bundle_id" '
      map(select(."app-bundle-id" == $bundle_id)) | .[0]."window-id" // empty'
}

focused_bundle_id=$("$aerospace" list-windows --focused --format '%{app-bundle-id}' 2>/dev/null || true)

# Any focused Helium window counts, not just the first one.
if [ "$focused_bundle_id" = "$helium_bundle_id" ]; then
  exec "$aerospace" focus-back-and-forth
fi

helium_window=$(helium_window_id)

if [ -z "$helium_window" ]; then
  /usr/bin/open -b "$helium_bundle_id"
  for _ in {1..60}; do
    sleep 0.05
    helium_window=$(helium_window_id)
    [ -n "$helium_window" ] && break
  done
fi

if [ -z "$helium_window" ]; then
  echo 'No Helium window appeared.' >&2
  exit 1
fi

"$aerospace" focus --window-id "$helium_window"
