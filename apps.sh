sudo pacman -Syu --noconfirm firefox discord spotify-launcher audacity kid3 steam

yay -Syu --noconfirm heroic-games-launcher-bin

flatpak install -y flathub com.stremio.Stremio org.vinegarhq.Sober

flatpak override --user \
  --filesystem=xdg-run/app/com.discordapp.Discord:create \
  --filesystem=xdg-run/discord-ipc-0 \
  org.vinegarhq.Sober
