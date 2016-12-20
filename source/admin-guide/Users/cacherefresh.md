## Cache Refresh

**Cache Refresh** was built by Gluu to pull user information from a
backend customer Active Directory/LDAP Server. Cache refresh dynamically
synchronizes user information from the backend data source of the
customer to the Gluu Server in order to maximize performance. This
feature is sensitive in nature and any incorrect action may result in
loss of data within the Gluu Server. Before configuring Cache Refresh,
you should read the Cache Refresh overview (see Articles). For any
questions relating to Cache Refresh functionality, you can ask for
assistance from [Gluu Support](http://support.gluu.org). *For a
successful Cache Refresh setup, you have to insert data in ALL FIELDS
below.*

![Cache Refresh Menu](/img/admin-guide/cacherefresh/admin_cache_menu.png "admin cache")

* _Last Run:_ The date and time of the latest cache refresh cycle
  completion is shown here.

* _Updates at the Last Run:_ This shows the total number of users who
  have been updated in the last Cache Refresh cycle. For example an user
  who has any of his attribute updated will show up here.

* _Problem at the Last Run:_ This shows the number of users who have
  been rejected by the Gluu Server during the update. If there are any
  rejections, please contact Gluu Support for clarification and help.

![Last Run](/img/admin-guide/cacherefresh/admin_cache_lastrun.png)

### Customer Backend Key and Attributes
![Customer Backend Key](/img/admin-guide/cacherefresh/admin_cache_backend.png)

* _Key Attribute:_ This is the unique key attribute of backend Active
  Directory/LDAP Server such as SAMAccountname for any Active Directory.

* _Object Class:_ This contains the Object Classes of the backend Active
  Directory/LDAP which has permission to talk to Gluu Server Cache Refresh
  such as person, organizationalPerson, user etc.

* _Source Attribute:_ This contains the list of attributes which will be
  pulled and read by the Gluu Server.

* _Custom LDAP Filter:_ If there is any custom search required, this
filtering mechanism can be used such as "sn=*" whereas the value of this
field ensures that every user must contain an attribute named SN.

### Source Backend LDAP Servers
![Source Backend](/img/admin-guide/cacherefresh/admin_cache_sourcebackend.png)

This section allows the Gluu Server to connect to the backend Active
Directory/LDAP server of the organization.

* _Name:_ Please input **source** as the value.

* _Use Anonymous Bind:_ Some customers do now allow username/password
  connections to their backend server. Enable this option if this applies
  to your organization.

* _Bind DN:_ This contains the username to connect to the backend
  server. You need to use full DN here. As for example,
  _cn=gluu,dc=company,dc=org_.

* _Use SSL:_ Use this feature if the backend server allows SSL
  connectivity.

* _Max Connections:_ This value defines the maximum number of
  connections that are allowed to read the backend Active Directory/LDAP
  server. It is recommended to keep the value of 2 or 3.

* _Server:_ This contains the backend Active Directory/LDAP server
  hostname with port i.e. backend.organization.com:389. If organization
  has a failover server, click **Add Server** and add more hostnames with
  port.

* _Base DN:_ This contains the location of the Active Directory/LDAP
  tree from where the Gluu Server shall read the user information.

* _Enabled:_ This check-box is used to save and push the changes. Do not
  use this unless the server administrator has entered all the required
  values.

* _Change Bind Password:_ This can be used for a new password or to
  change any existing password.

If your organization has a multiple Active Directory/LDAP server, click
on **Add source LDAP server** and add the additional server information.
Please remember that a *failover server* is not a new server.

### Inum LDAP Server

![Inum LDAP Server](/img/admin-guide/cacherefresh/admin_cache_inum.png)

This section of the application allows the server administrator to
connect to the internal LDAP of the Gluu Server. As Gluu Server
administrator, you do not need to insert anything here in this section
as new Gluu Server versions automatically populates this for you (unless
you try to manually configure it anyway).

* _Refresh Method:_ The Gluu Server allows the Server Administrator to
  apply two types of Cache Refresh mechanism--(i) VDS Method and (ii) Copy
  Method.

  1. _VDS Method:_ Any organization with a database like *mysql* can use
  the VDS method. This option can be enabled via the drop-down menu in
  Refresh Method option.

![Refresh VDS](/img/admin-guide/cacherefresh/admin_cache_refresh_vds.png)

  2. _Copy Method:_ If the organization has any kind of Active
  Directory/LDAP server, they are strongly recommended to use the *Copy
  Method* from the drop-down menu.

![Refresh Copy](/img/admin-guide/cacherefresh/admin_cache_refresh_copy.png)

### Attributes Mapping

When the Copy method is selected, a section for Attribute mapping will
be exposed. In this section, the Gluu Server Administrator can map any
attribute from the backend Active Directory/LDAP to the LDAP cache of
the Gluu Server.

![Attribute Mapping](/img/admin-guide/cacherefresh/admin_cache_mapattribute.png)

In the source attribute to destination attribute mapping field, you can
enter the source attribute value on the left, and the destination
attribute on the right. In other words, you can specify what the
attribute is on the backend in the left field, and what it should be
rendered as when it comes through the Gluu Server in the right field.

The Administrator can select any Cache Refresh Method according to the
backend Active Directory/LDAP server, but there are some essential
values for both types of cache refresh method. The values are given
below.

  * _Pooling Interval (Minutes):_ This is the interval value for running
    the Cache Refresh mechanism in the Gluu Server. It is recommended to 
    be kept higher than 15 minutes.

  * _Script File Name:_ The Gluu Server cache refresh can accept any
    kind of Jython Script which might help to calculate any custom/complex
    attribute i.e. eduPersonScopedAffiliation. For more information please
    contact Gluu Support.

  * _Snapshot Folder:_ Every cycle of of Gluu Server Cache Refresh cycle
    saves an overall snapshot and problem-list record on a specified
    location. This is where the Gluu Server Administrator can specify the
    location. You can easily decide whether cache refresh synchronizes all
    users or not. Generally the rejected users are enclosed in the
    problem-list file. An overall report is displayed at the top of the
    cache refresh page with headings **Updated at the last run** and
    **Problems at the last run**.

  * _Snapshot Count:_ This defines the total number of snapshots that
    are allowed to be saved in the hard drive of the VM. It is recommended
    to be kept to 20 snapshots.

Latest Gluu Servers (including Community Edition) introduced two
upgraded sections here.

  * _Server IP Address:_ Include the IP of your Gluu Server here. This
    feature helps to run Cache Refresh mechanism perfectly in a clustered
    environment.

  * _Removed Script File Name location:_ New version of the Gluu Server
    allows the administrator to manage your custom scripts with more
    interactive section under configuration named Manage Custom Scripts.

  * _Update:_ This button is used to push the changes in the Gluu
    Server. Hit this button only when the values have been entered,
    completely.

  * _Update and Validate Script:_ This button is used to test the
    operation and integrity of any custom script such as a Jython Script.
