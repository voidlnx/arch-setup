#!/bin/bash

sudo pacman -Syu --noconfirm intel-ucode vulkan-intel lib32-vulkan-intel

sudo reboot now
