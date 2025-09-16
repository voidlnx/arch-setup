#!/bin/bash

flatpak install -y flathub com.discordapp.Discord

flatpak run com.discordapp.Discord &
