chef_repo = Dir.pwd
cookbook_path    ["#{chef_repo}/cookbooks", "#{chef_repo}/site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
file_cache_path "#{chef_repo}/.cache"
file_backup_path "#{chef_repo}/.backup"
ssl_verify_mode :verify_peer
#encrypted_data_bag_secret "data_bag_key"
#
#knife[:berkshelf_path] = "cookbooks"
