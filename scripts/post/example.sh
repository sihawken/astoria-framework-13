#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
# Dependancies for gnome-shell-extension-installer
rpm-ostree install bash curl dbus perl git less

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/