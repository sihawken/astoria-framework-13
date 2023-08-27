#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

chmod 777 /usr/etc/systemd/system/dconf-update.service
systemctl unmask dconf-update.service
systemctl enable dconf-update.service