function set-date --wraps='timedatectl set-time $(hwclock --show -l)' --description 'alias set-date timedatectl set-time $(hwclock --show -l)'
  timedatectl set-time $(hwclock --show -l) $argv
        
end
