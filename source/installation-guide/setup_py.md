# Setup Options
## Scripted Installation

If you want to script the installation of the Gluu Server, here is what you can do to achieve your goal:

* Save and backup your existing file `setup.properties.last`.
* Uninstall existing Gluu Server installation.
* For a new installation you can either grab a new VM, or just use the existing one.
* Install Gluu Server CE, and log into the chroot.
* Copy your file `setup.properties.last` into the new server's  `/install/community-edition-setup/` location.
* Rename the file `setup.properties.last` to `setup.properties`.
* Run the setup script with `./setup.py` command.


## Command Line Options

Use `setup.py` to configure your Gluu Server and to add initial data
required for oxAuth and oxTrust to start. If `setup.properties` is found
in this folder, these properties will automatically be used instead of
the interactive setup.

The following options are available:

* __-a__ install Asimba
* __-c__ install CAS
* __-d__ specify the directory where community-edition-setup is located. Defaults to '.'
* __-f__ specify `setup.properties` file
* __-h__ invoke this help
* __-l__ install LDAP
* __-n__ no interactive prompt before install starts. Run with `-f`
* __-N__ no Apache httpd server
* __-s__ install the Shibboleth IDP
* __-u__ update hosts file with IP address/hostname
* __-w__ get the development head war files

