#!/usr/bin/env bash
#
#
# Darker Teal theme for Cinnamon - Apply changes to theme
#
#

echo "Updating system config to use the custom theme"

gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Teal'
gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Teal'

echo "Restarting Cinnamon to apply the custom theme"

cinnamon --replace >/dev/null 2>&1 &
