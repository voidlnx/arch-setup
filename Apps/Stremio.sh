#!/bin/bash

flatpak install -y flathub com.stremio.Stremio

mkdir -p ~/.local/share/applications

cat > ~/.local/share/applications/stremio-wayland.desktop <<EOF
[Desktop Entry]
Name=Stremio (Wayland)
Exec=flatpak run --env=QT_QPA_PLATFORM=wayland com.stremio.Stremio
Icon=com.stremio.Stremio
Type=Application
Categories=AudioVideo;Video;
StartupNotify=true
EOF

update-desktop-database ~/.local/share/applications
