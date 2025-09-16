#!/bin/bash

yay -Syu --noconfirm spotify spicetify-cli

spicetify backup apply

curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

spicetify apply

spotify &
