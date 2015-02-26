Template of Chef Repository
===========================

This is a template of Chef Repository.

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
