#!/usr/bin/bash

# Root privileges required
echo "Root privileges required"

# Wrote on January 18th 2024
echo "Wrote on January 18th 2024"

# Script tested on Linux Mint Cinnamon
echo "Script tested on Linux Mint Cinnamon."


######################

# Update packages
sudo apt update -y

######################

# Install Signal's public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

######################

# Adding repository
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

######################

# Update packages and install Signal

sudo apt update -y && sudo apt install signal-desktop -y
