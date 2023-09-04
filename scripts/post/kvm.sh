#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

rpm-ostree install virt-install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm \
    virt-manager virt-viewer guestfs-tools python3-libguestfs virt-top acpid

systemctl start acpid.service