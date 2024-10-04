#!/bin/sh

BOLDGREEN="\e[1;32m"
ENDCOLOR="\e[0m"

USER="maun"
HOME="/home/$USER"
CFG="$HOME/.config"
DOTS="$HOME/git/dotfiles"

UCODE="intel-ucode"

GITNAME="mart-mihkel"
GITMAIL="mart.mihkel.aun@gmail.com"

if [[ -z "$1" || "$1" == "core" ]]; then
    echo -e "\n${BOLDGREEN}[core]${ENDCOLOR}\n"

    usermod -a -G wheel "$USER"
    pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo man curl git neovim openssl openssh "$UCODE"

    git config --global user.name "$GITNAME"
    git config --global user.email "$GITMAIL"
    git config --global core.editor nvim
    git config --global init.defaultBranch master

    cp -rfv "$DOTS/nvim" "$CFG"
fi

if [[ -z "$1" || "$1" == "network" ]]; then
    echo -e "\n${BOLDGREEN}[network]${ENDCOLOR}\n"

    groupadd network
    usermod -a -G network "$USER"

    pacman -S --needed --noconfirm networkmanager

    systemctl enable NetworkManager
fi

if [[ -z "$1" || "$1" == "bluetooth" ]]; then
    echo -e "\n${BOLDGREEN}[bluetooth]${ENDCOLOR}\n"

    pacman -S --needed --noconfirm bluez bluez-utils
fi

if [[ -z "$1" || "$1" == "docker" ]]; then
    echo -e "\n${BOLDGREEN}[docker]${ENDCOLOR}\n"

    groupadd docker
    usermod -a -G docker "$USER"

    pacman -S --needed --noconfirm docker docker-compose docker-buildx containerd
    systemctl enable docker
fi

if [[ -z "$1" || "$1" == "bash" ]]; then
    echo -e "\n${BOLDGREEN}[bash]${ENDCOLOR}\n"

    pacman -S --needed --noconfirm bash-completion
    cp -fv "$DOTS/bash/.bashrc" "$HOME/.bashrc"
fi

if [[ -z "$1" || "$1" == "common" ]]; then
    echo -e "\n${BOLDGREEN}[common]${ENDCOLOR}\n"

    pacman -S --needed --noconfirm neofetch btop ripgrep make gcc go

    if [[ ! -e "$HOME/.rustup" ]]; then
        su "$USER" - c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
    fi

    if [[ ! -e "$HOME/.nvm" ]]; then
        su "$USER" -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash"
    fi
fi

if [[ -z "$1" || "$1" == "audio" ]]; then
    echo -e "\n${BOLDGREEN}[audio]${ENDCOLOR}\n"

    pacman -S --needed --noconfirm pipewire-alsa pipewire-pulse wireplumber
fi

if [[ -z "$1" || "$1" == "hyprland" ]]; then
    echo -e "\n${BOLDGREEN}[hyprland]${ENDCOLOR}\n"

    pacman -S --needed --noconfirm hyprland hypridle hyprlock hyprpaper greetd waybar wofi dunst libnotify polkit-kde-agent cliphist brightnessctl alacritty noto-fonts-emoji noto-fonts-cjk ttf-ubuntu-mono-nerd

    systemctl enable greetd.service

    cp -fv "$DOTS/greetd/config.toml" "/etc/greetd/config.toml"

    cp -rfv "$DOTS/alacritty" "$CFG"
    cp -rfv "$DOTS/waybar" "$CFG"
    cp -rfv "$DOTS/dunst" "$CFG"
    cp -rfv "$DOTS/wofi" "$CFG"
    cp -rfv "$DOTS/hypr" "$CFG"
fi

if [[ "$1" == "cfg" ]]; then
    echo -e "\n${BOLDGREEN}[configs]${ENDCOLOR}\n"

    cp -fv "$DOTS/greetd/config.toml" "/etc/greetd/config.toml"
    cp -fv "$DOTS/bash/.bashrc" "$HOME/.bashrc"

    rm -rfv "$CFG/nvim"
    cp -rfv "$DOTS/nvim" "$CFG"

    rm -rfv "$CFG/alacritty"
    cp -rfv "$DOTS/alacritty" "$CFG"

    rm -rfv "$CFG/wofi"
    cp -rfv "$DOTS/wofi" "$CFG"

    rm -rfv "$CFG/dunst"
    cp -rfv "$DOTS/dunst" "$CFG"

    rm -rfv "$CFG/waybar"
    cp -rfv "$DOTS/waybar" "$CFG"

    rm -rfv "$CFG/hypr"
    cp -rfv "$DOTS/hypr" "$CFG"
fi
