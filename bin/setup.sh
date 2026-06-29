#!/usr/bin/env bash
#
#
# Darker Teal theme for Cinnamon setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"

THEME_CUSTOM="$REPO/theme"
THEME_TARGET="/usr/share/themes/Mint-Y-Dark-Teal/cinnamon"

if [ -d "$THEME_TARGET" ]; then
  echo "Backing up existing theme..."
  mv "$THEME_TARGET" "$THEME_TARGET.default"
fi

ln -s "$THEME_CUSTOM" "$THEME_TARGET"
