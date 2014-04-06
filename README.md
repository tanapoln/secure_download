secure_download
===============

CarrierWave secure download url with CanCan for restrict permission

# Configuration
add following method to config/routes.rb

    secure_download_map

default path is /secure_download but if you want to change path, use 

    secure_download_map :path => "your_path"

then change store_dir in your carrierwave uploader class to other path
outside of public dir

Next, if you mount uploader in User model with this line

    mount_uploader :file, FileUploader

and you want any user to be able to download this file then,
add this rule to CanCan in ability.rb with format download_*.

    can :download_file, User

Where `file` is mount name and User is a model that mount the `file`.
You can add more specific permission, see more at https://github.com/ryanb/cancan/wiki/Defining-Abilities

# Usage
Normally, you use `user.file.url`, when this gem was added, use `user.file.secure_url` instead.
If you don't want user to be forced to download, use `user.file.secure_url(true)`