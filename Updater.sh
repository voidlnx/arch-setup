#!/bin/bash

sudo pacman -Syu --noconfirm

yay -Syu --noconfirm

flatpak -y update
