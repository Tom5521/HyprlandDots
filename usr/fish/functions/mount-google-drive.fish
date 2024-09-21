function mount-google-drive --wraps='rclone mount google-drive:/ drive/' --wraps='rclone mount google-drive:/ ~/rclone-drives/drive/' --description 'alias mount-google-drive rclone mount google-drive:/ ~/rclone-drives/drive/'
  rclone mount google-drive:/ ~/rclone-drives/drive/ $argv
        
end
