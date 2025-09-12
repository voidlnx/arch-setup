# Tutorial Arch Linux, Windows Dual Boot

iwctl

station wlan0 connect ***WIFI***

***PASSWORD***

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring

cfdisk /dev/***SDA-NVME***

* 1G, EFI System

* 16G, Linux swap

* ***G***, Linux filesystem

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

# post-install.sh

sudo nmcli dev wifi connect ***WIFI*** pasword "***PASSWORD***"

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash post-install.sh
