#!/bin/bash
set -e

sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf

sudo pacman -Syu --noconfirm lib32-mesa gdm gnome hyprland htop curl wget blueman pipewire alsa-utils pipewire-alsa
pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts noto-fonts-emoji ttf-font-awesome ttf-liberation ttf-dejavu
gnome-backgrounds p7zip xz gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg flatpak
inxi wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects gnome-software power-profiles-daemon xorg swww rofi wayland
qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons xdg-desktop-portal xdg-desktop-portal-wlr grim
rofi-emoji libxcb slurp nautilus eog gnome-text-editor gnome-control-center gnome-themes-extra gnome-tweaks vlc-plugin-gstreamer vlc-plugin-ffmpeg firefox

mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Pictures/Wallpapers
mkdir -p ~/.local/bin

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm --skippgpcheck
cd ~
rm -rf /tmp/yay

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout xclicker

echo "QT_QPA_PLATFORM=wayland" | sudo tee /etc/environment.d/qt-wayland.conf

flatpak install flathub com.github.tchx84.Flatseal -y

cd ~
git clone --depth=1 https://github.com/gxbrriellll/arch-dotfiles.git ~/arch-dotfiles

rsync -avh --progress ~/arch-dotfiles/.config/ ~/.config/

mkdir -p ~/.local/share/fonts
rsync -avh --progress ~/arch-dotfiles/.local/share/fonts/ ~/.local/share/fonts/

rsync -avh --progress ~/arch-dotfiles/Pictures/Wallpapers/ ~/Pictures/Wallpapers/

fc-cache -fv

rm -rf ~/arch-dotfiles

sudo systemctl enable gdm

sudo systemctl start gdm


