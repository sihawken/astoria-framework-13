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

# install appindicator and kstatusnotifieritem support
gnome-shell-extension-installer --yes 615

# install dash-to-dock
gnome-shell-extension-installer --yes 307

# install another window session manager
gnome-shell-extension-installer --yes 4709

# install app hider
gnome-shell-extension-installer --yes 5895

# install battery time
gnome-shell-extension-installer --yes 5425

# install bing wallpaper
gnome-shell-extension-installer --yes 1262