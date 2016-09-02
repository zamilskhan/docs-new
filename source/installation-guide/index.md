Installation Guide
# 1 Preparing VM for Gluu Server Installation
Gluu Server Community Edition (CE) does not have any fixed requirement to function properly, as the requirements depend on the data size it will handle. However there is a recommended minimum that Gluu suggests. If all the components are installed and used, then the VM needs at least the following:

|CPU Unit       |       RAM     |       Disk Space      | Processor Type|
|---------------|---------------|-----------------------|-------------------------|
|       2       |       4GB     |       40GB            |		64 Bit       |

!!! warning
    The processor type must be 64 bit for Gluu Server to function
!!! note
    Insufficient memory may cause unexpected errors and bugs which will require adjusting the resources for a smooth performance.

There are some other requirements that must fulfilled before you can install Gluu Server CE in the VM regarding tomcat memory heap and file descriptor settings.

## 1.1 Port
The following ports open for the Gluu Server to run. Please keep the ports open before installing Gluu Server.

|       Port Number     |       Protocol        |
|-----------------------|-----------------------|
|       80              |       tcp             |
|       443             |       tcp             |

## 1.2 Tomcat Memory Heap

The minimum recommended heap for tomcat server is 3GB for a test instance of Gluu Server Community Edition (CE). The minimum recommended tomcat heap memory is scaled higher for production instance at 4GB .

### 1.1.1 Alter Tomcat Memory Heap

The tomcat heap memory is set generally from the `setup.py` script prompt. This property can also altered from the `/opt/tomcat/conf/gluuTomcatWrapper.conf` file inside the Gluu Server chroot container setting `wrapper.java.initmemory` and `wrapper.java.maxmemory` properties.
Use the following command to open the gluuTomcatWrapper file
```
# vi /opt/tomcat/conf/gluuTomcatWrapper.conf
```

Please change the values in following parameters. This example is taken from a CentOS installation of Gluu Server.

```
# Initial Java Heap Size (in MB)
wrapper.java.initmemory=512

# Maximum Java Heap Size (in MB)
wrapper.java.maxmemory=1536
```

## 1.3 File Descriptor
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

## 1.4 Cloud Specific Instructions

### 1.4.1 Amazon AWS

Amazon AWS provides a public and private IP address to its clouds. While
running the `/install/community-edition-setup/setup.py` script, use the
Private IP address.

### 1.4.2 Microsoft Azure

Accessing the Gluu Server on Azure can be a little bit tricky because of
the Public/Private IP. Azure assigns a new Public/Private IP
addresses each time the server is started. Please see the [Azure Guide](./azure.md) for a step-by-step guide.

### 1.4.3 Linode VM

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


