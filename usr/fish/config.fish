source $__fish_config_dir/check-termux.fish

# C/C++ compilers
#
# I LOVE clang!
set CC clang
set CXX clang++

set EDITOR nvim

# Add ~/go/bin/ and ~/bin to the PATH
set PATH $HOME/go/bin $HOME/bin $PATH
set XDG_DATA_DIRS $HOME/.local/share/ $XDG_DATA_DIRS

# Until they fix the compilation with clang, this will always be g++
function hyprpm;CXX=g++ $PREFIX/bin/hyprpm $argv;end
function which;command -v $argv;end # Why the fuck which is deprecated?!?!?!
function nvim;CC=$CC CXX=$CXX $PREFIX/bin/nvim $argv;end

if status is-interactive
    set SKIP_GREETING 0 # 1 to disable usr and root grettings

    # Functions
    function fish_greeting
        if test $SKIP_GREETING -eq 1
            return
        end
        set -l cows ~/.config/fish
        # In this case, this files **MUST** be in /root/.config/fish directory, for security reasons
        if test (whoami) = "root"
            cowsay -e "0" -f "$cows/shark.cow" "What are we breaking today, boss?" \
            | lolcat -a -d 1
        else
            cowsay -e "^" -f "$cows/fish.cow" "Welcome to fish shell, $(whoami)!" \
            | lolcat
        end
        echo
    end
    function get-public-ip
        ip addr show wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 
    end
    function see-starwars
        telnet towel.blinkenlights.nl $argv
    end


    # Sets

    # WIN32 C/C++ cross compilers
    set WIN32_CC x86_64-w64-mingw32-gcc
    set WIN32_CXX x86_64-w64-mingw32-g++

    set USR $USER

    function mv
        command -v advmv > /dev/null
        if test $status -eq 0
            echo $status
            advmv -g $argv
        else
            $PREFIX/bin/mv $argv
        end
    end

    function cp
        command -v advcp > /dev/null
        if test $status -eq 0
            advcp -g $argv
        else
            $PREFIX/bin/cp $argv
        end
    end


    function eza
        command -v eza > /dev/null
        if test $status -eq 0
            $PREFIX/bin/eza --icons $argv
        else
            $PREFIX/bin/ls $argv
        end
    end

    # Abbreviations

    abbr --add mkd mkdir
    abbr --add inst yay -S
    abbr --add rem yay -R
    abbr --add rmf rm -rf
    abbr --add autoinst yay --noconfirm -S
    abbr --add autorem yay --noconfirm -R
    abbr --add hyprcfg cd ~/.config/hypr/
    abbr --add i3cfg cd ~/.config/i3/
    abbr --add spacman sudo pacman
    abbr --add fishcfg cd ~/.config/fish/
    abbr --add docker sudo docker
    abbr --add cdp cd $(pwd -P)

    # Aliases
    function ls;eza $argv;end
    function cls;clear $argv;end
    function la;eza -la $argv;end
    function dir;$PREFIX/bin/ls --color $argv;end
    function old-dir;$PREFIX/bin/dir $argv;end
    function please;sudo $argv;end
    function s;sudo $argv;end
    function poweroff;systemctl poweroff $argv;end
    function walk;fish -c "walk --icons $argv";end
    function umount;please umount $argv;end
    function mount;please mount $argv;end
    function claer;cls $argv;end
    function fdisk;please fdisk $argv;end

    if test (whoami) = "root"
        function rm;$PREFIX/bin/rm -i $argv;end
    end
end
