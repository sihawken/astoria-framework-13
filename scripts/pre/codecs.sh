#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

rpm-ostree install gstreamer1-plugin-libav gstreamer1-plugin-openh264 gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-free-fluidsynth gstreamer1-plugins-bad-free-wildmidi gstreamer1-plugins-bad-free-zbar gstreamer1-plugins-base gstreamer1-plugins-good-extras gstreamer1-plugins-good-gtk gstreamer1-plugins-good-qt gstreamer1-plugins-good-qt6
