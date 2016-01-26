## Scotchbox with some extra goodies on it
This is a fork of my vagrant-multihost repo with some extra stuff.

### Auto-create databases
When the machine is provisioned it runs through every directory in the `sites/` subfolder
and creates a database for it if it doesn't already exist.

### startup.sh
This requires the (https://github.com/emyl/vagrant-triggers)[vagrant-triggers] plugin. Runs startup.sh on vagrant up/reload.
For now all this does is run mailcatcher automatically for convenience. 
If you don't want this or can't install vagrant-triggers you can just remove it.

### The MDDD
Read about The Magnificent Downstream Data Dumper