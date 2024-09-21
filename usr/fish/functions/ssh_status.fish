function ssh_status --wraps='fish -c "systemctl status sshd.service"' --description 'alias sshStatus fish -c "systemctl status sshd.service"'
  systemctl status sshd.service 
end
