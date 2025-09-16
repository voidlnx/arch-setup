#!/bin/bash

sudo pacman -Syu --noconfirm lib32-mesa gdm gnome hyprland blueman alsa-utils pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts noto-fonts-emoji ttf-font-awesome ttf-liberation ttf-dejavu rofi-emoji libxcb gnome-backgrounds p7zip xz gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg flatpak slurp inxi wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects gnome-software power-profiles-daemon xorg swww rofi wayland qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons xdg-desktop-portal xdg-desktop-portal-wlr grim nautilus eog gnome-text-editor gnome-control-center gnome-themes-extra gnome-tweaks vlc-plugin-gstreamer vlc-plugin-ffmpeg vlc ntfs-3g pacman-contrib mesa mesa-utils mesa-demos libva-utils archlinux-keyring

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout

flatpak install -y flathub com.github.tchx84.Flatseal io.gitlab.librewolf-community