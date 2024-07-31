# User settings

WEB_BROWSER := "firefox"
MUSIC_PLAYER := "strawberry"
FILE_EXPLORER := "thunar"
OTHER_PACKAGES := "go scrcpy"
FLATPAK_PACKAGES := "org.kde.kdenlive"

# Installation process configurations

AUR_MANAGER := "yay"

# Other settings

PIPEWIRE_DEPENDENCIES := "pipewire gst-plugin-pipewire libpipewire libwireplumber pipewire pipewire-alsa pipewire-audio pipewire-docs pipewire-ffado pipewire-jack pipewire-pulse pipewire-roc pipewire-session-manager pipewire-v4l2 wireplumber"

install:
    just install-dependencies
    just install-packages
    just backup-files
    just install-files

install-dependencies:
    yay={{ AUR_MANAGER }}
    yay -S {{ PIPEWIRE_DEPENDENCIES }} --noconfirm
    yay -S swaync hyprland-git waybar waypaper swaybg neovim lua lua51 \
    btop kitty wlsunset topgrade zenity nwg-look nwg-clipman cliphist wl-clipboard network-manager-applet \
    kdeconnect kactivitymanagerd wofi grim slurp gtklock playerctl xdg-desktop-portal-hyprland-git \
    mate-polkit alsa-utils hyprprop walker fish \
    --noconfirm 

install-packages:
    yay={{ AUR_MANAGER }}
    yay -Syy
    just install-dependencies
    yay -S {{ MUSIC_PLAYER }} {{ WEB_BROWSER }} {{ FILE_EXPLORER }} {{ OTHER_PACKAGES }} --noconfirm
    flatpak install {{ FLATPAK_PACKAGES }} -y

install-files:
    path="~/.config/hypr/"
    mkdir -p $path
    cp ./* $path -rf
    cd $path

    ln -sr nvim ../nvim
    ln -sr waypaper ../waypaper
    ln -sr fish ../fish

backup-files:
    # neovim
    mv ~/.config/nvim ~/.config/nvim.bak
    # hyprland
    mv ~/.config/hypr ~/.config/hypr.bak
    # waypaper
    mv ~/.config/waypaper ~/.config/waypaper.bak
    # fish
    mv ~/.config/fish ~/.config/fish.bak


update-neovim:
    git add nvim
    git commit -m "Update submodules"
    git push
