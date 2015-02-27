Template of Chef Repository
===========================

This is a template of Chef repository which is designed to work for
Chef Solo, Knife Solo and Chef Server.

Initial Setup
-------------

Clone the template with using git, and setup bundler.

```
git clone https://github.com/kjtanaka/template-chef-repo.git chef-repo
cd chef-repo
rm -rf .git
git init
bundle install
```

Chef Solo
---------

```
chef-solo -c .chef/solo -j node/localhost.json
```

Knife Solo
---------

```
knife solo prepare host1.example.org
knife solo cook host1.example.org
```

Chef Server
---------------
TBD

Encrypt Data Bags
-----------------

#### Step 1. Setup data bag secret for encryption

Generate `data_bag_key` file with this.

```
openssl rand -base64 512 | tr -d '\r\n' > data_bag_key
chmod 400 data_bag_key
```
The `data_bag_key` is so important that you should keep a copy somewhere else securely.

#### Step 2. Enable encrypted data bag

Uncomment `encrypted_data_bag_secret` on `.chef/knife.rb`.

```
sed -i -e 's/^#encrypted.*/encrypted_data_bag_secret "data_bag_key"/' .chef/knife.rb
```

#### Step 3. Setup $EDITOR envrionment.

The follows is an example with vi.

```
export EDITOR=vi
```

#### Step 4. Create a data bag and an item.

Here's an example. The data bag is mybag, item is secrets.

```
knife solo data bag create mybag secrets
```

#### Step 5. Load your data bag item into your recipe

```
secrets = Chef::EncryptedDataBagItem.load("mybag", "secrets")
mysql_password = secrets['mysql_password']
```

License and Authors
-------------------
- Author:: Koji Tanaka (<kj.tanaka@gmail.com>)

```text
Copyright 2015, FutureSystems, Indiana Univercity

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
