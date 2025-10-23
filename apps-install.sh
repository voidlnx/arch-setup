sudo pacman -Syu firefox discord spotify-launcher audacity kid3 steam

yay -Syu heroic-games-launcher-bin

flatpak install -y flathub com.stremio.Stremio org.vinegarhq.Sober com.protonvpn.www

flatpak override --user \
  --filesystem=xdg-run/app/com.discordapp.Discord:create \
  --filesystem=xdg-run/discord-ipc-0 \
  org.vinegarhq.Sober
