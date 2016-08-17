# Gluu Server Community Edition in Red Hat Enterprise Linux (RHEL)
Gluu Server Community Edition is installed through `.rpm` package supplied from the Gluu repository.
## Install Gluu chroot Package
### RHEL 6.5
The following commands will install Gluu Server `chroot`. The supported versions include 6.6,6.7 and 6.8

|       Command Description     |               RHEL 6.x              |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/centos/Gluu-centos6.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Import GPG Key          |rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

**Note:** See the [Setup Script Options Page](setup_py.md) for information on the setup script.

### RHEL 7.2
The following commands will install Gluu Server `chroot`


|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/rhel/Gluu-rhel7.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/rhel/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|	Import GPG Key		|rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

**Note:** See the [Setup Script Options Page](setup_py.md) for information on the setup script.

## Finalizing Installation
The setup is completed by running the setup script `setup.py` from the setup folder. The server must be running so that the administrator can log into the chroot environment and run the script. The commands differ in RHEL 6.x and RHEL 7

* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               RHEL 6.x                |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |service gluu-server-2.4.4 start        |
|       Log into Gluu `chroot`  |service gluu-server-2.4.4 login        |
|       Run Setup Script        |cd /install/community-edition-setup/ <br/>./setup.py|

|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/sbin/gluu-serverd-2.4.4 start		|
|       Log into Gluu `chroot`  |/sbin/gluu-serverd-2.4.4 login		|
|       Run Setup Script        |cd /install/community-edition-setup/ <br/>./setup.py|

## Uninstall Gluu chroot Package
Gluu Server uninstallation follows the same principle as package removal from RHEL. The sevrer must be stopped to remove the package.

|       Command Description     |               RHEL 6.x	        |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |service gluu-server-2.4.4 stop     	|
|       Uninstall Gluu Server   |yum remove gluu-server-2.4.4       	|
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/sbin/gluu-serverd-2.4.4 stop		|
|       Uninstall Gluu Server	|yum remove gluu-server-2.4.4		|
|	Remove backup folder	|rm -rf /opt/gluu-server-2.4.4*		|
