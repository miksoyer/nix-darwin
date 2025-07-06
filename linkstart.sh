#! /bin/bash

# 1. open vpn

# 2. install the command line tools(must)
xcode-select --install

# 3. clone the nix dotfile repository
sudo git clone https://github.com/Fy-Apple/nix.git /etc/nix-darwin

# 4. configure dir
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
sudo git config --global --add safe.directory /etc/nix-darwin

# 5. install determined nix, choose no to avoid install nix for xxx
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 6. edit your hostname in settings


# 7. Installing nix-darwin
sudo nix run nix-darwin/master#darwin-rebuild -- switch --impure --extra-experimental-features "nix-command flakes"

# 8. rebuild
sudo darwin-rebuild switch --impure --show-trace --flake /etc/nix-darwin#HUAWEI-MateBook-Fold

