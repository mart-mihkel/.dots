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

FONTDIR="$HOME/local/share/fonts"

if [[ -z "$1" || "$1" == "core" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[core]${ENDCOLOR}\n\n\n"

    usermod -a -G wheel "$USER"
    pacman -S --needed --noconfirm base base-devel linux linux-firmware sudo man curl neovim openssl openssh "$UCODE"

    if [[ ! -e /usr/bin/yay ]]; then
        git clone https://aur.archlinux.org/yay-bin.git
        (cd yay-bin && makepkg -si)
        rm -rf yay-bin
    fi

    cp -rf "$DOTS/nvim" "$CFG"
fi

if [[ -z "$1" || "$1" == "power" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[power]${ENDCOLOR}\n\n\n"

    su "$USER" -c "yay -S --needed --noconfirm auto-cpufreq"
fi

if [[ -z "$1" || "$1" == "network" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[network]${ENDCOLOR}\n\n\n"

    groupadd network
    usermod -a -G network "$USER"

    pacman -S --needed --noconfirm iwd

    rm -f /etc/iwd/main.conf
    echo -e "[General]\nEnableNetworkConfiguration=true" > /etc/iwd/main.conf

    systemctl enable iwd.service
fi

if [[ -z "$1" || "$1" == "bluetooth" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[bluetooth]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm bluez bluez-utils
fi

if [[ -z "$1" || "$1" == "docker" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[docker]${ENDCOLOR}\n\n\n"

    groupadd docker
    usermod -a -G docker "$USER"

    pacman -S --needed --noconfirm docker docker-compose docker-buildx containerd
    systemctl enable docker
fi

if [[ -z "$1" || "$1" == "git" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[git]${ENDCOLOR}\n\n\n"

    git config --global user.name "$GITNAME"
    git config --global user.email "$GITMAIL"
    git config --global core.editor nvim
    git config --global init.defaultBranch master
fi

if [[ -z "$1" || "$1" == "bash" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[bash]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm bash-completion
    cp -f "$DOTS/.bashrc" "$HOME/.bashrc"
fi

if [[ -z "$1" || "$1" == "common" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[common]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm neofetch btop ripgrep make gcc go

    if [[ ! -e "$HOME/.rustup" ]]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    fi

    if [[ ! -e "$HOME/.nvm" ]]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
        nvm install 22
    fi
fi

if [[ -z "$1" || "$1" == "fonts" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[fonts]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm fontconfig noto-fonts-emoji noto-fonts-cjk

    mkdir -p "$FONTDIR"
    cp -f "$DOTS/fonts/." "$FONTDIR"
    fc-cache -f -v
fi

if [[ -z "$1" || "$1" == "audio" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[audio]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm pipewire-alsa pipewire-pulse wireplumber
fi

if [[ -z "$1" || "$1" == "hyprland" ]]; then
    echo -e "\n\n\n${BOLDGREEN}[hyprland]${ENDCOLOR}\n\n\n"

    pacman -S --needed --noconfirm hyprland hypridle hyprlock hyprpaper waybar wofi swaync polkit-kde-agent cliphist brightnessctl alacritty
    su "$USER" -c "yay -S --needed --noconfirm xdg-desktop-portal-hyprland-git"

    cp -rf "$DOTS/alacritty" "$CFG"
    cp -rf "$DOTS/waybar" "$CFG"
    cp -rf "$DOTS/wofi" "$CFG"
    cp -rf "$DOTS/hypr" "$CFG"
fi
