#!/bin/bash

sudo pacman -Syu --noconfirm lib32-mesa xorg xorg-server xorg-xinit xorg-apps xfce4 xfce4-goodies sddm firefox discord steam kid3 gnome-text-editor nautilus ark audacity sassc hyprland blueman alsa-utils pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts noto-fonts-emoji ttf-font-awesome ttf-liberation ttf-dejavu rofi-emoji libxcb gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg slurp inxi wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects power-profiles-daemon swww rofi wayland qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons okular xdg-desktop-portal xdg-desktop-portal-wlr grim eog vlc-plugin-gstreamer vlc-plugin-ffmpeg vlc ntfs-3g pacman-contrib mesa mesa-utils mesa-demos libva-utils archlinux-keyring

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout xclicker heroic-games-launcher-bin

flatpak install -y flathub com.github.tchx84.Flatseal org.vinegarhq.Sober

flatpak override --user \
  --filesystem=xdg-run/app/com.discordapp.Discord:create \
  --filesystem=xdg-run/discord-ipc-0 \
  org.vinegarhq.Sober
