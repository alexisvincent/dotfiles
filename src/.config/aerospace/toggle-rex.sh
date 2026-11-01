#!/usr/bin/env bash
# Toggle Rex on AeroSpace workspace T.
# Press on T to return to the previous workspace; elsewhere, show Rex on T.

set -euo pipefail

aerospace=/opt/homebrew/bin/aerospace
jq=/opt/homebrew/bin/jq
rex_bundle_id=com.superlogical.rex
rex_app='/Applications/Rex Beta.app'

focused=$($aerospace list-workspaces --focused)

if [ "$focused" = "T" ]; then
  exec "$aerospace" workspace-back-and-forth
fi

rex_window_id() {
  "$aerospace" list-windows --all \
    --format '%{window-id} %{app-bundle-id} %{window-title} %{workspace}' --json \
    | "$jq" -r --arg bundle_id "$rex_bundle_id" '
      map(select(."app-bundle-id" == $bundle_id)
        | select((."window-title" | test("^Settings($| -)")) | not))
      | sort_by(if .workspace == "T" then 0 else 1 end)
      | .[0]."window-id" // empty'
}

rex_window=$(rex_window_id)

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

"$aerospace" move-node-to-workspace --window-id "$rex_window" T
"$aerospace" workspace T
"$aerospace" focus --window-id "$rex_window"
