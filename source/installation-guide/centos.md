# Gluu Server in CentOS
Gluu Server Gluu Server Community Edition (CE) is installed from the Gluu Server repository and the supported verions include 6.5 and onwards. The install setps are detailed below

* Add Gluu repository
* Add GPG key
* Install Gluu Server
* Start Gluu Server
* Log into the Gluu `chroot`
* Run the setup script

## CentOS 6.5
The following commands are used to install Gluu Server CE in CentOS 6.5

**Note:** The support extends to CentOS 6.6, 6.7 and 6.8

|	Command Description	|		CentOS 6.x		|
|-------------------------------|---------------------------------------|
|	Add Gluu Repository	|wget https://repo.gluu.org/centos/Gluu-centos6.repo -O /etc/yum.repos.d/Gluu.repo|
|	Add Gluu GPG Key	|wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|	Update/Clean Repo	|yum clean all				|
|	Install Gluu Server	|yum install gluu-server-2.4.4		|
|	Start Gluu Server	|service gluu-server-2.4.4 start	|
|	Log into Gluu `chroot`	|service gluu-server-2.4.4 login	|
|	Stop Gluu Server	|service gluu-server-2.4.4 stop		|
|	Run Setup Script	|cd /install/community-edition-setup/ <br/>./setup.py|

**Note:** See the [Setup Script Options Page](setup_py.md) for information on finalizing installation.

## CentOS 7.2
The following commands are used to install Gluu Server CE in CentOS 6.x and CentOS 7.2

|       Command Description     |               CentOS 7.2              |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/centos/Gluu-centos7.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |
|       Start Gluu Server       |/sbin/gluu-serverd-2.4.4 start|
|       Log into Gluu `chroot`  |/sbin/gluu-serverd-2.4.4 login|
|       Stop Gluu Server        |/sbin/gluu-serverd-2.4.4 stop|
|       Run Setup Script        |cd /install/community-edition-setup/ <br/>./setup.py|

**Note:** See the [Setup Script Options Page](setup_py.md) for information on finalizing installation.

