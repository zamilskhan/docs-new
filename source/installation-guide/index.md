[TOC]
# Hardware 
Gluu Server is very flexible, and can be used for a wide array of
access management requirements. Depending on the size of your data, and
the number of concurrent transactions you want to support, you may need
more or less memory or CPU capacity.

If you are running all the Gluu Server services on the same server (i.e.
SAML, OAuth2, LDAP), you will need at least:

|CPU Unit	|	RAM	|	Disk Space	|
|---------------|---------------|-----------------------|
|	2	| 	4GB 	| 	40GB		|

**Note:** *Insufficient memory may case unexpected bugs and errors; on such situation it is recommended to adjust the resources based on your specific requirements.*

# Operating System
Gluu Server Community Edition is available for the following Operating Systems.
Click on the desired operating system for deployment guide.

|	Operating System	|	Supported Versions	|	Architecture|	
|-------------------------------|-------------------------------|-------------------|
|[Ubuntu](./ubuntu.md)		|**14.04.2**, **16.04**		|	64 Bit|
|[CentOS](./centos.md)		|**6.5, 6.6, 6.7**, **7.2**	|	64 Bit|
|[RHEL](./rhel.md)		|**6**, **7**			|	64 Bit|
|[Debian Jessie](./debian.md) 	|**8.x**		        |       64 Bit|
	
## Tomcat Memory Heap
The minimum recommended heap for tomcat server is 3GB for a test instance of Gluu Server Community Edition (CE). The minimum recommended tomcat heap memory is scaled higher for production instance at 4GB .

The tomcat heap memory is set generally from the `setup.py` script prompt. This property can also altered from the `/opt/tomcat/conf/gluuTomcatWrapper.conf` file inside the Gluu Server chroot container setting `wrapper.java.initmemory` and `wrapper.java.maxmemory` properties.

## File Descriptor
Gluu recommends setting the `file descriptors` to 65k for Gluu Server CE. The following steps will help set the `file descriptor` limit.

* Edit the `/etc/security/limits.conf` file.
* Add the following lines in the `limits.conf` file. Please replace the `username` with the user that will install Gluu Server.
	
```
* soft nofile 65536
* hard nofile 262144
```

* Edit the `/etc/pam.d/login` by adding the line:
```
session required /lib/security/pam_limits.so
```
* Use the system file limit to increase the file descriptor limit to 65535. The system file limit is set in `/proc/sys/fs/file-max`.
```
echo 65535 > /proc/sys/fs/file-max
```

* Use the `ulimit` command to set the file descriptor limit to the hard limit specified in `/etc/security/limits.conf`.
```
ulimit -n unlimited
```
* Restart your system.

## Port
The following ports open for the Gluu Server to run. Please keep the ports open before installing Gluu Server.

|	Port Number	|	Protocol	|
|-----------------------|-----------------------|
|	80		|	tcp		|
|	443		|	tcp		|

# Cloud Specific Requirements
## Amazon AWS
Amazon AWS provides a public and private IP address to its clouds. While
running the `/install/community-edition-setup/setup.py` script, use the
Private IP address.

## Microsoft Azure
Accessing the Gluu Server on Azure can be a little bit tricky because of
the Public/Private IP. Azure assigns a new Public/Private IP
addresses each time the server is started. Please see the [Azure Guide](./azure.md) for more info.

## Linode
The Linode Virtual Machines (VM) use a custom kernel which is not supported by Gluu Server, therefore the kernel must be updated before Gluu Server can be installed in Linode VM. The following steps will guide you through kernel update in the Linode VM.

* Check for the current version of the kernel. If the output contains `-Linode`, then proceed
```
# uname -a
```

* Run the following command to update the kernel
```
# apt-get install linux-image-virtual grub2
```

* Modify `grub` file in the `/etc/default/` folder
```
# vim /etc/default/grub
```

    - Ensure that the following lines are present in the glub file
```
GRUB_TIMEOUT=10
GRUB_CMDLINE_LINUX="console=ttyS0,19200n8"
GRUB_DISABLE_LINUX_UUID=true
GRUB_SERIAL_COMMAND="serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1"
```

* Finally run the following commands to update `grub` and reboot
```
# update-grub
# reboot
```

# Available Components

When you deploy the Gluu Server, you will have the opportunity to
specify which of the following software you want to use on your
server:

- __oxAuth:*__ oxAuth provides endpoints for an OpenID Connect Identity
  Provider (IdP) and an UMA Authorization Server (AS). Both OpenID
  Connect and UMA are standard profiles of OAuth 2.0, used for single
  sign-on (SSO) and web and API access management, respectively.
- __oxTrust:*__ oxTrust is the graphical user interface that is used for
  server management.
  __LDAP:*__ The Gluu Server ships with a fork of the OpenDJ LDAP server.
  It is used to store attributes and server configurations locally.
- __Apache 2 web server:*__ Apache 2 serves the web server for the Gluu
  Server. Without Apache 2, it is not possible to see the hostname from 
  a browser.
- **Shibboleth 2 SAML IDP:** The Shibboleth server provides endpoints
  for a SAML Identity Provider (IdP). If you want to create single
  sign-on (SSO) to a SAML SP, you will need a SAML IdP.
- **Asimba SAML Proxy:** The Asimba SAML proxy should be deployed on if
  your organization needs to consolidate inbound SAML authentication
  from the IdPs of partners to a single website or app.
- **CAS:** CAS is legacy at this point and should only be deployed if
  your organization has existing apps that can only support CAS for
  single sign-on.
- **oxAuth RP:** The oxAuth RP is a web UI to enable OpenID Connect
  discovery, dynamic client registration, and authentication testing.
 

*__Note:__* * implies that the software should *always* be deployed.

# Support
Gluu offers both community and VIP support. Anyone can browse and open
tickets on our [support portal](http://support.gluu.org). For private
support, expedited assistance, and strategic consultations, please view
[our pricing](http://gluu.org/pricing) and [schedule a meeting with
us](http://gluu.org/booking) to discuss VIP support options.


