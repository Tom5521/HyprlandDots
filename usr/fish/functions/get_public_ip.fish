function get_public_ip --wraps='bash ~/Scripts/getip.sh' --description 'alias get_public_ip'
  ip addr show wlan0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 
end
