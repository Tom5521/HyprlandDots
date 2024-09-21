function mount-mega --wraps='rclone mount Mega:/ ~/rclone-drives/mega' --description 'alias mount-mega rclone mount Mega:/ ~/rclone-drives/mega'
  rclone mount Mega:/ ~/rclone-drives/mega $argv
        
end
