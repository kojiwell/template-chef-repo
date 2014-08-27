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

how to setup encrypted_data_bag_secret
--------------------------------------

Execute the following command.

```
openssl rand -base64 512 | tr -d '\r\n' > data_bag_key
```

And then, uncomment `encrypted_data_bag_secret` on `.chef/knife.rb`.
