[TOC]
# Authentication Management in Gluu Server
Gluu Server supports multiple authentication methods apart form the default internal LDAP authentication. The mechanisms support single and multi factor authentication using the custom script feature. By default the `internal` method will authenticate against the internal LDAP packaged with Gluu Server. Additionally there are other methods available which are detailed below.

Gluu Server makes it possible to define business logic for complex multi-factor authentication workflow providing Single Sign On (SSO) using smart cards, tokens, mobile or biometric authentication mechanisms. The choice is not limited to a single authentication mechanism for every authentication, but use different mechanism to reach the same result. 

Gluu leverages its interception script infrastructure for multi-factor authentication--[custom jython interception scripts](../customize/script.md/) can call third party authentication services via API's or vendor libraries. Sophisticated authentication logic can implement adaptive authentication. For example, you can add extra authentication steps based on contextual information, such as fraud scores, location, or browser profiling. You can also customize the look and feel of a web authentication: html, css, images and javascript can be externalized and managed by your organization. 


## Authentication Management using oxTrust
There are different authentication mechanism definable for two groups of end-users. The default authentication mode available under the `Manage Athentication` tab is used to define the authentication method for oxTrust and connected Service Providers. The screenshot below shows the authentication management tab.

![auth-mode](../img/auth-mode/auth-mode.png)

The `Authentication Mode` tab defines the mechanism used for general users who are authenticated using Gluu Server. An example is any SP connected to Gluu Server will envoke the authentication method selected under the `Authentication Mode` field. The users loggin into oxTrust administrator interface will envoke the `oxTrust authentication mode`. These methods are only for defining the method used for authentication. The methods are definable using the custom script feature which contains different authentication methods out of the box.

## Authentication Methods
The following multi-factor authentication is available in Gluu Server out of the box.

1. DUO

2. Certificate

3. oxPush2

4. U2F

5. Wikid

