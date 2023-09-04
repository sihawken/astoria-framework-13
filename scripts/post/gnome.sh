#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.

# Dependencies for gnome-shell-extension-installer
rpm-ostree install bash curl dbus perl git less

wget -O gnome-shell-extension-installer "https://raw.githubusercontent.com/brunelli/gnome-shell-extension-installer/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

declare -a gnome_extensions
gnome_extensions=()
gnome_extensions+=( 7 ) # 7 removeable drive menu
gnome_extensions+=( 277 ) # 277 impatience
gnome_extensions+=( 307 ) # 307 dash-to-dock
gnome_extensions+=( 517 ) # 517 caffeine
gnome_extensions+=( 615 ) # 615 appindicator and kstatusnotifieritem support
gnome_extensions+=( 779 ) # 779 clipboard indicator
gnome_extensions+=( 1386 ) # 1386 notification counter
gnome_extensions+=( 1437 ) # 1437 current screen only for alternate tab
gnome_extensions+=( 1446 ) # 1446 transparent window moving
gnome_extensions+=( 3193 ) # 3193 blur my shell
gnome_extensions+=( 3733 ) # 3733 tiling assistant
gnome_extensions+=( 3956 ) # 3956 gnome fuzzy app search
gnome_extensions+=( 4245 ) # 4245 gesture improvements
gnome_extensions+=( 4228 ) # 4288 wireless HID
gnome_extensions+=( 4691 ) # 4691 PiP on top
gnome_extensions+=( 4711 ) # 4711 prevent double empty window
gnome_extensions+=( 4854 ) # 4854 system76 scheduler
gnome_extensions+=( 4937 ) # 4937 draw on your screen 2
gnome_extensions+=( 5090 ) # 5090 space bar
gnome_extensions+=( 5263 ) # 5263 gtk4-desktop-icons-ng-ding
gnome_extensions+=( 5353 ) # 5353 window state manager
gnome_extensions+=( 5410 ) # 5410 grand theft focus
gnome_extensions+=( 5425 ) # 5425 battery time
gnome_extensions+=( 5482 ) # 5482 toggle workspace span
gnome_extensions+=( 5835 ) # 5835 rx input layout switcher
gnome_extensions+=( 5895 ) # 5895 app hider
gnome_extensions+=( 6239 ) # 6239 unmess

gnome-shell-extension-installer --yes ${gnome_extensions[@]}

# Fixes permission issues with system extensions
chmod 655 -R /usr/share/gnome-shell/extensions/*/*