#!/bin/bash

flatpak install -y flathub org.vinegarhq.Sober

flatpak override --user \
  --filesystem=xdg-run/app/com.discordapp.Discord:create \
  --filesystem=xdg-run/discord-ipc-0 \
  org.vinegarhq.Sober
  
  flatpak run org.vinegarhq.Sober &
