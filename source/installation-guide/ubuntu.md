# Gluu Server Community Edition in Ubuntu Server
Gluu Server Community Edition is installed through `.deb` package supplied from the Gluu repository.
## Install Gluu chroot Package
### Ubuntu Server 14.04.2
The following commands will install Gluu Server `chroot`

|       Command Description     |               Trusty Commands         |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |echo "deb https://repo.gluu.org/ubuntu/ trusty main" > /etc/apt/sources.list.d/gluu-repo.list|
|       Add Gluu GPG Key        |curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -|
|       Update/Clean Repo       |apt-get update                         |
|       Install Gluu Server     |apt-get install gluu-server-2.4.4      |

**Note:** See the [Setup Script Options Page](setup_py.md) for information on finalizing installation.

### Ubuntu Server 16.04
The following commands will install Gluu Server `chroot`

|       Command Description     |               Xenial Commands         |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |echo "deb https://repo.gluu.org/ubuntu/ xenial main" > /etc/apt/sources.list.d/gluu-repo.list|
|       Add Gluu GPG Key        |curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -|
|       Update/Clean Repo       |apt-get update                         |
|       Install Gluu Server     |apt-get install gluu-server-2.4.4      |

**Note:** See the [Setup Script Options Page](setup_py.md) for information on finalizing installation.

## Finalizing Installation
The setup is completed by running the setup script `setup.py` from the setup folder. The server must be running so that the administrator can log into the chroot environment and run the script.

* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               Trusty & Xenial Commands|
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/etc/init.d/gluu-server-2.4.4 start    |
|       Log into Gluu `chroot`  |/etc/init.d/gluu-server-2.4.4 login    |
|       Run Setup Script        |cd /install/community-edition-setup/ <br/>./setup.py|

## Uninstall Gluu chroot Package
Gluu Server uninstallation follows the same principle as package removal from Ubuntu. The server must be stopped to remove the package.

|       Command Description     |               Trusty & Xenial Commands|
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/etc/init.d/gluu-server-2.4.4 stop     |
|	Uninstall Gluu Server   |apt-get remove gluu-server-2.4.4	|
|	Remove backup folder	|rm -rf /opt/gluu-server-2.4.4*		|

