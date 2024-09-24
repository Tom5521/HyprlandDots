if status is-interactive 
    # Functions
    function fish_greeting 
        set cows ~/.config/fish
        if test (whoami) = "root"
            cowsay -e "0" -f "$cows/shark.cow" "What are we breaking today, boss?" | lolcat -a -d 1
        else
            cowsay -e "^" -f "$cows/fish.cow" "Welcome to fish shell, $(whoami)!" | lolcat
        end
    end
    function get-public-ip
        ip addr show wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 
    end
    function see-starwars
        telnet towel.blinkenlights.nl $argv
    end

    # Aliases
    function ls;eza --icons $argv;end
    function mv;advmv -g $argv;end
    function cp;advcp -g $argv;end
    function cls;clear $argv;end
    function la;eza -la --icons $argv;end
    function dir;ls $argv;end
    function please;sudo $argv;end
    function s;sudo $argv;end
    function poweroff;systemctl poweroff $argv;end
    function mkd;mkdir $argv;end
    function walk;walk --icons $argv;end
    function umount;please umount $argv;end
    function mount;please mount $argv;end
    function claer;cls $argv;end
    function docker;please docker $argv;end
    function hyprconf;cd ~/.config/hypr/;end
    function i3conf;cd ~/.config/i3/;end
    function fdisk;please fdisk $argv;end
    function spacman;please pacman $argv;end
    function fishconf;cd ~/.config/fish;end

    # Sets

    # C/C++ compilers.
    set CC clang
    set CXX clang++

    # WIN32 C/C++ cross compilers
    set WIN32_CC x86_64-w64-mingw32-gcc
    set WIN32_CXX x86_64-w64-mingw32-g++

    set EDITOR nvim

    # Add ~/go/bin/ and ~/bin to the PATH
    set PATH $HOME/go/bin $HOME/bin $PATH
end
