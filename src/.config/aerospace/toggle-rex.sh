#!/usr/bin/env bash
# Toggle Rex: start it if it isn't running and focus its terminal window.
# Press again while Rex is focused to go back to the previous window.

set -euo pipefail

aerospace=/opt/homebrew/bin/aerospace
jq=/opt/homebrew/bin/jq
rex_bundle_id=com.superlogical.rex
rex_app='/Applications/Rex Beta.app'

rex_window_id() {
  "$aerospace" list-windows --all \
    --format '%{window-id} %{app-bundle-id} %{window-title}' --json \
    | "$jq" -r --arg bundle_id "$rex_bundle_id" '
      map(select(."app-bundle-id" == $bundle_id)
        | select((."window-title" | test("^Settings($| -)")) | not))
      | .[0]."window-id" // empty'
}

rex_window=$(rex_window_id)
focused_window=$("$aerospace" list-windows --focused --format '%{window-id}' 2>/dev/null || true)

if [ -n "$rex_window" ] && [ "$focused_window" = "$rex_window" ]; then
  exec "$aerospace" focus-back-and-forth
fi

if [ -z "$rex_window" ]; then
  /usr/bin/open -a "$rex_app"
  for _ in {1..60}; do
    sleep 0.05
    rex_window=$(rex_window_id)
    [ -n "$rex_window" ] && break
  done
fi

if [ -z "$rex_window" ]; then
  echo 'No Rex terminal window appeared.' >&2
  exit 1
fi

"$aerospace" focus --window-id "$rex_window"
