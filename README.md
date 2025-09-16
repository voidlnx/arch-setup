# Tutorial Arch Linux, Dual Boot Windows

iwctl

station wlan0 connect ***wifi***

***password***

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring

lsblk

cfdisk /dev/***sda-nvme***

* 1G, EFI System

* 16G, Linux swap

* ***G***, Linux filesystem

lsblk

mkfs.fat -F32 /dev/***1G,EFISystem***

mkfs.ext4 /dev/***G,Linuxfilesystem***

mkswap /dev/***16G,Linuxswap***

swapon /dev/***16G,Linuxswap***

mount /dev/***G,Linuxfilesystem*** /mnt

mkdir /mnt/efi

mount /dev/***1G,EFISystem*** /mnt/efi

pacstrap -K /mnt base base-devel linux linux-headers linux-firmware ***intel/amd***-ucode sudo git nano fastfetch htop make cmake curl wget bluez bluez-utils networkmanager cargo gcc pipewire efibootmgr grub dosfstools mtools os-prober

genfstab -U /mnt >> /mnt/etc/fstab

cat /mnt/etc/fstab

arch-chroot /mnt

passwd

***password***

***password***

useradd -m -g users -G wheel,storage,video,audio -s /bin/bash ***user***

passwd ***user***

***password***

EDITOR=nano visudo

-# (***%wheel ALL=(ALL:ALL) ALL***).

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

hwclock --systohc

nano /etc/locale.gen 

-# (***en_US . UTF-8 UTF-8***).

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

cat /etc/locale.conf

echo "***pc***" >> /etc/hostname

nano /etc/hosts

***127.0.1.1***        ***pc***.localdomain        ***pc***

mkdir /windows

mount /dev/***Windows,EFISystem*** /windows/

nano /etc/default/grub

-# (***GRUB_TIMEOUT=30***, ***GRUB_TERMINAL_OUTPUT=console***, ***GRUB_DISABLE_OS_PROBER***).

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

sudo systemctl enable bluetooth NetworkManager

exit

umount -lR /mnt

shutdown now

# Post-install

sudo nmcli dev wifi connect ***wifi*** pasword "***password***"

sudo nano /etc/pacman.conf

-# (***[multilib]***, ***Include = /etc/pacman.d/mirrorlist***).

mkdir -p ~/Pictures/Screenshots 

mkdir -p ~/Pictures/Wallpapers

mkdir -p ~/.local/bin

mkdir -p ~/.local/share/fonts

sudo pacman -Syu --noconfirm lib32-mesa gdm gnome hyprland blueman alsa-utils pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol noto-fonts noto-fonts-emoji ttf-font-awesome ttf-liberation ttf-dejavu rofi-emoji libxcb gnome-backgrounds p7zip xz gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg flatpak slurp inxi wayland-protocols xorg-xwayland waybar kitty qt5-graphicaleffects gnome-software power-profiles-daemon xorg swww rofi wayland qt5-wayland qt5-base qt5-xcb-private-headers kio kconfig kcoreaddons xdg-desktop-portal xdg-desktop-portal-wlr grim nautilus eog gnome-text-editor gnome-control-center gnome-themes-extra gnome-tweaks vlc-plugin-gstreamer vlc-plugin-ffmpeg vlc ntfs-3g pacman-contrib mesa mesa-utils mesa-demos libva-utils archlinux-keyring

git clone https://github.com/gxbrriellll/arch-dotfiles.git

cd /tmp

git clone https://aur.archlinux.org/yay.git ~/arch-dotfiles

cd yay

makepkg -si --noconfirm

yay -Syu --noconfirm appimagelauncher waypaper cliphist wlogout

flatpak install -y flathub com.github.tchx84.Flatseal io.gitlab.librewolf-community

rsync -avh --progress ~/arch-dotfiles/.config/ ~/.config/

rsync -avh --progress ~/arch-dotfiles/.local/share/fonts/ ~/.local/share/fonts/

rsync -avh --progress ~/arch-dotfiles/Pictures/Wallpapers/ ~/Pictures/Wallpapers/

fc-cache -fv

echo "QT_QPA_PLATFORM=wayland" | sudo tee /etc/environment.d/qt-wayland.conf

sudo systemctl enable gdm

sudo systemctl start gdm
