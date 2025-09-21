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

pacstrap -K /mnt base base-devel linux linux-headers linux-firmware ***intel/amd***-ucode sudo git nano fastfetch htop make cmake curl wget bluez bluez-utils networkmanager cargo gcc go flatpak pipewire efibootmgr grub dosfstools mtools os-prober

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

mkdir -p ~/.icons

mkdir -p ~/.themes

mkdir -p ~/.local/bin

git clone https://github.com/gxbrriellll/arch-dotfiles.git

git clone https://github.com/gxbrriellll/arch-setup.git

cd /tmp

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm

cd arch-setup

chmod +x post-install.sh

./post-install.sh

mv ~/arch-dotfiles/.config/* ~/.config/

mv ~/arch-dotfiles/.local/share/fonts/ ~/.local/share/fonts/

mv ~/arch-dotfiles/Pictures/Wallpapers/ ~/Pictures/Wallpapers/

fc-cache -fv

sudo pacman -Syu

yay -Syu

flatpak update

sudo systemctl enable --now sddm.service

sudo systemctl start sddm.service
