# Authentication in the Gluu Server - Introduction

Using the  Gluu Server, you can define the business logic for complex multi-step authentication workflows, providing SSO for people using smart cards, tokens, mobile or biometric authentication mechanisms. You don't have to chose one multi-factor authentication technology. You can have multiple authentication mechanisms active at the same time--Web or mobile clients can request a certain authentication type by using standard OpenID Connect request parameters.

A number of multi-factor authentication scripts are shipped in the Gluu Server by default, including support for FIDO U2F tokens, Gluu's free mobile two-factor application [Super Gluu](https://super.gluu.org), certificate authentication, and Duo Security. 

Gluu leverages its interception script infrastructure for multi-factor authentication--[custom jython interception scripts](../customize/script.md/) can call third party authentication services via API's or vendor libraries. Sophisticated authentication logic can implement adaptive authentication. For example, you can add extra authentication steps based on contextual information, such as fraud scores, location, or browser profiling. You can also customize the look and feel of a web authentication: html, css, images and javascript can be externalized and managed by your organization. 

Another feature of Gluu Server authentication is that you can define "Levels", enabling you to define the relative strength of several authentication workflows.

