Template of Chef Repository
===========================

This is a template of Chef REpository.

Initial Setup
-------------
TBD

Use Chef Solo
---------
TBD

Use Knife Solo
---------
TBD

Use Chef Server
---------------
TBD

Encrypt Data Bags
-----------------

#### Step 1. Generate `data_bag_key` file by this;

```
openssl rand -base64 512 | tr -d '\r\n' > data_bag_key
```

#### Step 2. Uncomment `encrypted_data_bag_secret` on `.chef/knife.rb`.

#### Step 3. Make sure `EDITOR` is set on your environment. 

The follows is an example with vi.

```
export EDITOR=vi
```

#### Step 4. Create a data bag and an item like this(ex. data bag is mybag, item is secrets).

```
knife solo data bag create mybag secrets
```
