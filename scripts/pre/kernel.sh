#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!

set -oue pipefail

rpm-ostree install sysfsutils

echo "devices/pci0000:00/0000:00:02.0/sriov_numvfs = 1" > /etc/sysfs.conf

# allow simple `dnf install` style commands to work (in some spec scripts)
ln -s /usr/bin/rpm-ostree /usr/bin/dnf
ln -s /usr/bin/ld.bfd /etc/alternatives/ld && ln -s /etc/alternatives/ld /usr/bin/ld 

# Install akmod-i915
rpm-ostree install akmod-i915-sriov
akmods --force --kernels "$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

depmod -a "$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

# Regenerate the initramfs
/usr/bin/dracut --reproducible -v --add 'ostree' --no-hostonly -f /lib/modules/"$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"/initramfs.img "$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

echo 'ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0x4626", ATTR{sriov_numvfs}="1"' >  /etc/udev/rules.d/5-sriov.rules

