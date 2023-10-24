#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!

set -oue pipefail

mkdir -p /lib/firmware/updates/i915/
wget https://raw.githubusercontent.com/intel-gpu/intel-gpu-firmware/main/firmware/adlp_guc_70.9.1.bin -O /lib/firmware/updates/i915/adlp_guc_70.bin
