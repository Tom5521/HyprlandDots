function mount-onedrive --wraps='rclone mount onedrive:/ onedrive' --wraps='rclone mount onedrive:/ ~/rclone-drives/onedrive' --description 'alias mount-onedrive rclone mount onedrive:/ ~/rclone-drives/onedrive'
  rclone mount onedrive:/ ~/rclone-drives/onedrive $argv
        
end
