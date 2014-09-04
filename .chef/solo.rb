chef_repo = Dir.pwd
cookbook_path    ["#{chef_repo}/cookbooks", "#{chef_repo}/site-cookbooks"]
node_path        "#{chef_repo}/nodes"
role_path        "#{chef_repo}/roles"
environment_path "#{chef_repo}/environments"
data_bag_path    "#{chef_repo}/data_bags"
file_cache_path "#{chef_repo}/.cache"
file_backup_path "#{chef_repo}/.backup"
ssl_verify_mode :verify_peer
#encrypted_data_bag_secret "#{chef_repo}/data_bag_key"
#
#knife[:berkshelf_path] = "#{chef_repo}/cookbooks"
