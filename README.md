# Tutorial Arch Linux, Dual Boot Windows

iwctl

station wlan0 connect ***WIFI***

***PASSWORD***

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring

lsblk

cfdisk /dev/***SDA-NVME***

* 1G, EFI System

* 16G, Linux swap

* ***G***, Linux filesystem

lsblk

mkfs.fat -F32 /dev/***1G,EFISYSTEM***

mkfs.ext4 /dev/***G,LINUXFILESYSTEM***

mkswap /dev/***16G,LINUXSWAP***

swapon /dev/***16G,LINUXSWAP***

mount /dev/***G,LINUXFILESYSTEM*** /mnt

mkdir /mnt/efi

mount /dev/***1G,EFISYSTEM*** /mnt/efi

mkdir /windows

mount /dev/WINDOWSEFI /windows/

pacstrap -K /mnt base base-devel linux linux-headers linux-firmware sudo git nano ***INTEL/AMD***-ucode networkmanager bluez bluez-utils grub fastfetch efibootmgr dosfstools mtools os-prober gcc cargo ntfs-3g make pacman-contrib mesa mesa-utils mesa-demos libva-utils archlinux-keyring

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

passwd

***PASSWORD***

***PASSWORD***

useradd -m -g users -G wheel,storage,video,audio -s /bin/bash ***USER***

passwd ***USER***

***PASSWORD***

EDITOR=nano visudo

(***%wheel ALL=(ALL:ALL) ALL***).

ln -sf /usr/share/zoneinfo/

America/

New_York /etc/localtime

hwclock --systohc

nano /etc/locale.gen 

(***en_US . UTF-8 UTF-8***).

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

cat /etc/locale.conf

echo "***PC***" >> /etc/hostname

nano /etc/hosts

***127.0.1.1***        ***PC***.localdomain        ***PC***

nano /etc/default/grub

(***GRUB_DISABLE_OS_PROBER***, ***GRUB_TIMEOUT=30***, ***GRUB_CMDLINE_LINUX_DEFAULT***, ***GRUB_TERMINAL_OUTPUT***).

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable

grub-mkconfig -o /boot/grub/grub.cfg

sudo systemctl enable bluetooth NetworkManager

exit

umount -lR /mnt

shutdown now

# post-install.sh

sudo nmcli dev wifi connect ***WIFI*** pasword "***PASSWORD***"

git clone https://github.com/gxbrriellll/arch-post-install.git

cd arch-install

bash arch-post-install.sh
