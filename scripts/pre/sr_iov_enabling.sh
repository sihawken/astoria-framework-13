#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# FOLLOWING INSTRUCTIONS FROM:
# https://www.michaelstinkerings.org/gpu-virtualization-with-intel-12th-gen-igpu-uhd-730/

# Install prerequisites
echo "devices/pci0000:00/0000:00:02.0/sriov_numvfs = 7" > /etc/sysfs.conf

# May not need to be deleted - TO REMOVE
# rm -rf /lib/modules/6.2.14-300.fc38.x86_64/kernel/drivers/gpu/drm/i915/i915.ko.xz

xz i915.ko
mv i915.ko /lib/modules/$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')/extra/i915.ko
depmod $(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')

rpm-ostree remove make binutils kernel-devel-$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')
rm -rf /usr/src/i915-sriov-dkms-6.1