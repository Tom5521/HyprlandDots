function set-ntp --wraps='timedatectl set-ntp true' --wraps='sudotimedatectl set-ntp true' --wraps='sudo timedatectl set-ntp true' --description 'alias set-ntp sudo timedatectl set-ntp true'
  sudo timedatectl set-ntp true $argv
        
end
