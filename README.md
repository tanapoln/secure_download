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

# Usage
without this gem, you use model.carrierwave_file.url
when this gem was added, use model.carrierwave_file.secure_url instead

Next, add CanCan permission in ability.rb with format download_*.
So, if you have

    mount_uploader :file, FileUploader

in User model, and you want user to be able to download the file then,
add this line to ability.rb

    can :download_file, User

Where `file` is column name and User is a model that this column be inside.
You can add further filter, see more at https://github.com/ryanb/cancan/wiki/Defining-Abilities