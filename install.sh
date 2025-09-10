#!/bin/bash
set -e

HOSTNAME="admin"
USERNAME="admin"
PASSWORD="admin"

pacstrap -K /mnt base base-devel linux linux-headers linux-firmware \
  sudo nano fastfetch htop make curl wget bluez blueman bluez-utils networkmanager \
  cargo gcc pipewire efibootmgr grub dosfstools mtools os-prober alsa-utils \
  pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts \
  noto-fonts-emoji ttf-font-awesome archlinux-keyring git ttf-liberation ttf-dejavu mesa-utils \
  libva-utils gnome-backgrounds p7zip xz gst-libav gst-plugins-base gst-plugins-good \
  gst-plugins-bad gst-plugins-ugly ffmpeg flatpak inxi mesa-demos mesa \
  wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects \
  pacman-contrib gnome-software power-profiles-daemon xorg swww rofi wayland \
  qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons \
  ntfs-3g xdg-desktop-portal xdg-desktop-portal-wlr grim rofi-emoji \
  libxcb slurp nautilus eog gnome-text-editor gnome-control-center \
  gnome-themes-extra gnome-tweaks vlc-plugin-gstreamer vlc-plugin-ffmpeg

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash -e <<EOF

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc

sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "$HOSTNAME" > /etc/hostname
cat <<EOT > /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   ${HOSTNAME}.localdomain ${HOSTNAME}
EOT

echo "root:$PASSWORD" | chpasswd
useradd -m -g users -G wheel,storage,video,audio -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd

sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

grep -q "GRUB_DISABLE_OS_PROBER" /etc/default/grub || echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=30/' /etc/default/grub
sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub
sed -i 's/^#GRUB_TERMINAL_OUTPUT=.*/GRUB_TERMINAL_OUTPUT="gfxterm console"/' /etc/default/grub

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable bluetooth
systemctl enable NetworkManager
EOF

umount -lR /mnt
reboot now
