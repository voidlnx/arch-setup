# install.sh (Dual Boot, Windows)

iwctl

station wlan0 connect WIFI

PASSWORD

exit

pacman -Sy

pacman -S --noconfirm archlinux-keyring 

pacman -S --noconfirm git

git clone https://github.com/gxbrriellll/arch-install.git

cfdisk /dev/SDA-NVME

* 1G, EFI System

* 16G, Linux swap

* G

mkfs.fat -F32 /dev/1G,EFISYSTEM

mkfs.ext4 /dev/G
y

mkswap /dev/16G,LINUXSWAP

swapon /dev/16G,LINUXSWAP

mount /dev/G /mnt

mkdir /mnt/efi

mount /dev/16G,LINUXSWAP /mnt/efi

cd arch-install

bash install.sh

# post-install.sh

sudo nmcli dev wifi connect WIFI pasword "PASSWORD"

sudo pacman -Syu --noconfirm

git clone https://github.com/gxbrriellll/arch-install.git

cd arch-install

bash post-install.sh
