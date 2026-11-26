#!/usr/bin/env bash
# Install my devbox setup on a fresh Fly Sprite, or on a Vercel sandbox (Ubuntu image).
#
#   curl -fsSL https://raw.githubusercontent.com/alexisvincent/dotfiles/master/install-devbox.sh | bash -s [NAME]
#
# The devbox repo (github.com/alexisvincent/devbox) is private and sets up everything else, so
# this only does what has to happen before that repo exists on the box:
#
#   1. install the 1Password CLI
#   2. store the 1Password service-account token
#   3. clone the devbox repo to ~/code/devbox
#   4. run its bootstrap.sh, passing NAME (the tailnet hostname) through
#
# The token comes from $DEVBOX_OP_TOKEN, or is used as it is if already at
# ~/.config/devbox/op-token. No secrets live in this file.
#
# DEVBOX_REF=<branch or tag> clones that ref of the devbox repo instead of its default branch.
# On a bare image (Vercel's Ubuntu sandbox image has no curl): first run
#   sudo apt-get update -qq && sudo apt-get install -y -qq curl ca-certificates
set -euo pipefail
TOKEN="$HOME/.config/devbox/op-token"
DIR="$HOME/code/devbox"

# 0. What the steps below call. A Sprite has all of it; a bare Ubuntu image has none.
for c in git gpg curl; do
  command -v "$c" >/dev/null && continue
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq git gnupg curl ca-certificates >/dev/null
  break
done

# 1. 1Password CLI
if ! command -v op >/dev/null; then
  curl -sS https://downloads.1password.com/linux/keys/1password.asc \
    | sudo gpg --dearmor --yes --output /usr/share/keyrings/1password-archive-keyring.gpg
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' \
    | sudo tee /etc/apt/sources.list.d/1password.list >/dev/null
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq 1password-cli >/dev/null
fi

# 2. Token
install -d -m 700 "$(dirname "$TOKEN")"
if [ -n "${DEVBOX_OP_TOKEN:-}" ]; then
  ( umask 077; printf '%s\n' "$DEVBOX_OP_TOKEN" > "$TOKEN" )
fi
[ -s "$TOKEN" ] || { echo "install-devbox: set DEVBOX_OP_TOKEN, or put the token at $TOKEN" >&2; exit 1; }
chmod 600 "$TOKEN"

# 3. Clone. The repo's own git credential helper is inside it, so this first clone uses a
#    throwaway helper that reads the GitHub token from 1Password.
if [ ! -d "$DIR/.git" ]; then
  helper="$(mktemp)"
  trap 'rm -f "$helper"' EXIT
  cat > "$helper" <<EOF
#!/usr/bin/env bash
[ "\$1" = get ] || exit 0
pat=\$(OP_SERVICE_ACCOUNT_TOKEN="\$(cat "$TOKEN")" op read op://dev-box/github-pat/credential)
printf 'username=x-access-token\npassword=%s\n' "\$pat"
EOF
  chmod 700 "$helper"
  mkdir -p "$(dirname "$DIR")"
  git -c credential.helper= -c credential.helper="$helper" \
    clone -q ${DEVBOX_REF:+--branch "$DEVBOX_REF"} https://github.com/alexisvincent/devbox.git "$DIR"
  rm -f "$helper"
fi

# 4. Hand over
"$DIR/bootstrap.sh" "$@"
