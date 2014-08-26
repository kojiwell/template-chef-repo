cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"

knife[:berkshelf_path] = "cookbooks"
ssl_verify_mode  :verify_peer

#
# Setting for Encrypted Data Bag
#
#encrypted_data_bag_secret "data_bag_key"

#
# Example of Chef Server Setting
#
#chef_repo = Dir.pwd
#log_level                :info
#log_location             STDOUT
#node_name                'root'
#client_key               '#{chef_repo}/.chef/user.pem'
#validation_client_name   'chef-validator'
#validation_key           '/etc/chef-server/chef-validator.pem'
#chef_server_url          'https://chef.example.com:443'
#syntax_check_cache_path  '#{chef_repo}/.chef/syntax_check_cache'
