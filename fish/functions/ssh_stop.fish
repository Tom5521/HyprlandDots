function ssh_stop --wraps='echo 4142|sudo -S systemctl stop sshd.service' --wraps='echo 4142|sudo -S systemctl stop sshd.service & sshStatus' --description 'alias stopSSH echo 4142|sudo -S systemctl stop sshd.service & sshStatus'
  echo 4142|sudo -S systemctl stop sshd.service & ssh_status $argv
        
end
