# User settings

WEB_BROWSER := "thorium-browser-bin"
MUSIC_PLAYER := "strawberry"
FILE_EXPLORER := "thunar"
OTHER_PACKAGES := "go scrcpy kdenlive"

# FLATPAK_PACKAGES := "org.kde.kdenlive"
# Installation process configurations

AUR_MANAGER := "yay"

# Other settings

PIPEWIRE_DEPENDENCIES := "pipewire gst-plugin-pipewire libpipewire libwireplumber pipewire pipewire-alsa pipewire-audio pipewire-docs pipewire-ffado pipewire-jack pipewire-pulse pipewire-roc pipewire-session-manager pipewire-v4l2 wireplumber"

install:
    just install-dependencies
    just install-packages
    just backup-files
    just install-files

install-aur-manager:
    #!/bin/bash
    cd /tmp
    git clone https://aur.archlinux.org/packages/{{ AUR_MANAGER }}
    cd {{AUR_MANAGER}}
    makepkg -si --noconfirm
    cd

install-dependencies:
    #!/usr/bin/bash
    yay={{ AUR_MANAGER }}
    yay -S {{ PIPEWIRE_DEPENDENCIES }} --noconfirm
    yay -S base-devel rustup cmake swaync hyprland-git waybar neovim lua lua51 \
    btop kitty wlsunset topgrade zenity nwg-look nwg-clipman cliphist wl-clipboard network-manager-applet \
    kdeconnect kactivitymanagerd wofi grim slurp gtklock playerctl xdg-desktop-portal-hyprland-git \
    mate-polkit alsa-utils hyprprop fish luarocks tree-sitter-lua wlroots 7-zip hyprshade walker-bin glava \
    wpaperd nwg-clipman \
    --noconfirm 

install-packages:
    #!/usr/bin/bash
    yay={{ AUR_MANAGER }}
    yay -Syy
    just install-dependencies
    yay -S {{ MUSIC_PLAYER }} {{ WEB_BROWSER }} {{ FILE_EXPLORER }} {{ OTHER_PACKAGES }} --noconfirm

#   flatpak install {{ FLATPAK_PACKAGES }} -y

install-files:
    #!/usr/bin/bash
    path="~/.config/hypr/"
    mkdir -p $path
    cp ./* $path -rf
    cd $path

    ln -sr ./usr/* ../

install-hyprshade:
    hyprshade install
    systemctl --user enable --now hyprshade.timer

install-system-configs:
    sudo ./system/install.sh

backup-files:
    # fish
    mv ~/.config/fish ~/.config/fish.bak
    # neovim
    mv ~/.config/nvim ~/.config/nvim.bak
    # swaync
    mv ~/.config/swaync ~/.config/swaync.bak
    # walker
    mv ~/.config/walker ~/.config/walker.bak
    # waybar
    mv ~/.config/waybar ~/.config/waybar.bak
    # waypaper
    mv ~/.config/waypaper ~/.config/waypaper.bak


    # hyprland
    mv ~/.config/hypr ~/.config/hypr.bak

update-neovim:
    git add usr/nvim
    git commit -m "Update submodules"
    git push
