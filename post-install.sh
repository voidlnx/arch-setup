#!/bin/bash

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm

sudo pacman -Syu --noconfirm lib32-mesa xorg xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-setting firefox discord steam kid3 gnome-text-editor nautilus ark audacity sassc hyprland blueman alsa-utils pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts noto-fonts-emoji ttf-font-awesome ttf-liberation ttf-dejavu rofi-emoji libxcb gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg slurp inxi wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects power-profiles-daemon xorg swww rofi wayland qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons okular xdg-desktop-portal xdg-desktop-portal-wlr grim eog vlc-plugin-gstreamer vlc-plugin-ffmpeg vlc ntfs-3g pacman-contrib mesa mesa-utils mesa-demos libva-utils archlinux-keyring

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout xclicker heroic-games-launcher-bin

flatpak install -y flathub com.github.tchx84.Flatseal org.vinegarhq.Sober

flatpak override --user \
  --filesystem=xdg-run/app/com.discordapp.Discord:create \
  --filesystem=xdg-run/discord-ipc-0 \
  org.vinegarhq.Sober

sudo pacman -Syu --noconfirm

yay -Syu --noconfirm

flatpak update -y

git clone https://github.com/voidlnx/arch-dotfiles.git

mv ~/arch-dotfiles/.config/* ~/.config/

mv ~/arch-dotfiles/.local/share/fonts/ ~/.local/share/fonts/

mv ~/arch-dotfiles/Pictures/Wallpapers/ ~/Pictures/Wallpapers/

fc-cache -fv

sudo systemctl enable --now lightdm
