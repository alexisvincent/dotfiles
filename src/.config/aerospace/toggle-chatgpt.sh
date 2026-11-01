#!/usr/bin/env bash
# Toggle ChatGPT on AeroSpace workspace C.
#
# Press on C -> workspace-back-and-forth (return to the previous workspace).
# Press elsewhere -> switch to C, open ChatGPT if needed, then focus it.

aerospace=/opt/homebrew/bin/aerospace
chatgpt_bundle_id=com.openai.codex

focused=$($aerospace list-workspaces --focused)

if [ "$focused" = "C" ]; then
  exec $aerospace workspace-back-and-forth
fi

$aerospace workspace C

chatgpt_ids() {
  $aerospace list-windows --all --format '%{window-id} %{app-bundle-id}' --json \
    | jq -r --arg bundle_id "$chatgpt_bundle_id" \
      '.[] | select(."app-bundle-id" == $bundle_id) | ."window-id"'
}

chatgpt=$(chatgpt_ids | head -1)

if [ -z "$chatgpt" ]; then
  open -b "$chatgpt_bundle_id"
  for _ in {1..60}; do
    sleep 0.05
    chatgpt=$(chatgpt_ids | head -1)
    [ -n "$chatgpt" ] && break
  done
fi

if [ -n "$chatgpt" ]; then
  $aerospace move-node-to-workspace --window-id "$chatgpt" C
  $aerospace focus --window-id "$chatgpt"
fi
