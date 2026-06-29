#!/usr/bin/env bash
#
#
# Darker Teal theme for Cinnamon setup
#
#

REPO="$(cd "$(dirname "$0")/.." && pwd)"

THEME_CUSTOM="$REPO/theme"
THEME_TARGET="/usr/share/themes/Mint-Y-Dark-Teal/cinnamon"

if [ -L "$THEME_TARGET" ]; then
	echo "Skipping symlink setup, it already exists at '$THEME_TARGET'"
else
	echo 'Requesting sudo'
	sudo -v

	if [ -d "$THEME_TARGET" ]; then
	  echo "Backing up existing theme directory to '$THEME_TARGET.default'"

	  sudo mv "$THEME_TARGET" "$THEME_TARGET.default"
	fi

	echo "Setting up a symlink - '$THEME_TARGET' > '$THEME_CUSTOM'"

	sudo ln -s "$THEME_CUSTOM" "$THEME_TARGET"
	sudo chown -R "$(id -u):$(id -g)" "$THEME_TARGET"
fi

echo "Updating system config to use the custom theme"

gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Teal'
gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Teal'

echo "Restarting Cinnamon to apply the custom theme"

cinnamon --replace >/dev/null 2>&1 &

echo "Done"
