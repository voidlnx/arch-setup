# install.sh (Dual Boot, Windows)

iwctl

station wlan0 connect WIFI

PASSWORD

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring git

cfdisk /dev/SDA-NVME

* 1G, EFI System

* 16G, Linux swap

* G, Linux filesystem

mkfs.fat -F32 /dev/1G,EFISYSTEM

mkfs.ext4 /dev/G,LINUXFILESYSTEM

mkswap /dev/16G,LINUXSWAP

swapon /dev/16G,LINUXSWAP

mount /dev/G,LINUXFILESYSTEM /mnt

mkdir /mnt/efi

mount /dev/1G,EFISYSTEM /mnt/efi

mkdir /windows

mount /dev/WINDOWSEFI /windows/

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash install.sh

# post-install.sh

sudo nmcli dev wifi connect WIFI pasword "PASSWORD"

sudo pacman -Syu --noconfirm

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash post-install.sh
