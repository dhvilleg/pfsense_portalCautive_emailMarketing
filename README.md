# email-Marketing with pfsense CaptivePortal

This project is a little fork of pfsense Captive Portal module, this project allows to Captive Portal shown a form with a name, e-mail and celular phone, in order to gives internet services to clients, later saves this information into a My-SQL database and finally sends a report of login users to a email list for marketing purposes.

To built this implementation, follow next steps.

## First configuration

 1. Download oficial pfsense 2.4.4p3 from oficial [page.](https://www.pfsense.org/download/)
 2. Install pfsense in to your favorite environment, i use in this case [Oracle VirtualBox](https://www.virtualbox.org/)
 3. Open your virtual console and set IP address from option 2:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/Pfsense_set_LANIpADDR.PNG)

 4. Login into pfsense Web management console with ip address set before, use default passwords, system will request change password, once logged, will going to do first configuration. ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsenseFirstConf_1.PNG)

 5. Set hostname and domain, this step is very important, because with FQDN name will configure  autosign  certificate later, also configure your DNS servers.
 ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsenseFirstConf_2.PNG)
 
 6. Set WAN IP address, if you don't in setp 3
 ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsenseFirstConf_4.PNG)

 7. Two next steps, configure LAN address (if you don't before) and change root password:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsenseFirstConf_5.PNG)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsenseFirstConf_6.PNG)

## Configure services

 1. In order to get a auto sign certificate, first, we need create an CA (certificate authority) and then create our certificate, follow next steps:
	 - [ ] Go to System -> Certificate Manager -> Create CA. Input location fields according to your organization:
	 ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CA_conf_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CA_conf_1_1.png)
	 
	 - [ ] Add a new sign
	 ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CA_conf_2.png)
	 
	 - [ ] Set location information and set common name like your FQDN.
	 ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CA_conf_2_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CA_conf_2_2.png)	 

 2. Configure DNS forwarding and DHC services.
	 - [ ] Enable DSN forwarder feature to allow this server resolve internet domain names:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DNS_Forwarder_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DNS_Forwarder_2.png)

	 - [ ] Enable DHCP server according to your needs
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DHCP.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DHCP_2.png)

	 - [ ] Finally, Captive Portal configuration should be like this, on SSL certificate, choose certificate created before, and upload your custom images and index.html :
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_2.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_3.png)
![enter image description here](https://github.com/dhvilleg/pfsense_portalCautive_emailMarketing/blob/master/images/pfsense_CaptivePortal_conf_1_4.png?raw=true)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CaptivePortal_conf_1_5.png)
  ![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_CaptivePortal_conf_1_7.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_enableCustomPG.png)

	 - [ ] Before upload contacts.php script ensure that you change your server FQDN name and your captive portal zone name, in line 61 change:
	 this

		> form name="login_form" method="post" action="https://pfsense.localdomain.example.com:8003/index.php?zone=zoneprueba2
		
		for
		

		> form name="login_form" method="post" action="https://YOUR_FQDN_SERVER:8003/index.php?zone=YOUR_ZONE_NAME
		
		To upload a file you need a SCP client		![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/pfsense_enableCustomPG_2_upload.png)
## Configure dependences 
To save the login information in a database, create reports and send these reports by email, we must install some dependencies such as Mysql, ssmtp and PHP_Mysqli, to make it easier, I did an installation script located on: [Installation script](https://github.com/dhvilleg/pfsense_portalCautive_emailMarketing/blob/master/scripts/install.sh), be carefull with execution without change parameters such as passwords, e-mail source, e-mail authorization passwords, e-mail recipments, and so on.

Before to install all packages, you must [create an authorization password](https://www.lifewire.com/get-a-password-to-access-gmail-by-pop-imap-2-1171882) for sender account. 

All scripts created with install.sh are included in the GitHub repository, these scripts are shown below with a brief description:
| GitHub Location |script name | Server location |description
|--|--|--|--|
| root directory | index.html |upload through pfsense captive portal conf.|Custom login page, contains login form and passes this information to contacts.php
|root directory|contacts.php|/usr/local/captiveportal|takes the login information, saves it in a database and offers an internet session
|scripts|script.sh|/root/|schedule this script in a crontab to get a clients login report
|scripts|mysql-server.sh|/usr/local/etc/rc.d/|Mysql Start/Stop services script
|scripts|install.sh|/root/|install all dependences and write most important scripts and configuration files
|scripts|CreateBDD|none|little script to create databases table 
|/scripts/usr/bin/local/|mysql_relaunch.sh|/scripts/usr/bin/local/|schedule this script every 5 minutes to ensure sql server always still running
|images|captiveportal-background.jpg|upload through pfsense captive portal conf.|your custom background image
|images|captiveportal-logo.png|upload through pfsense captive portal conf.|your custom logo image
|email_sender/root|body.txt|/root|email report body, this file is made by script.sh
|email_sender/root|crontab	|none|crontab example
|email_sender/root|header.txt|/root|email header, this file is user to make body.conf, change email recipments in this file
|email_sender/root|usuarios.php|/root|Create a report with information from the database, send information from the last 7 days and also write the second part of the body's email.
|conf_files/usr/local/etc/ssmtp/|ssmtp.conf|/usr/local/etc/ssmtp/|configure here your gmail account and your auth passwd.

## Conclutions and results
Take special attention to prerequisites and desing considerations, wee need minimun a PC or server with two NIC's one for WAN(internet access) and another for LAN (Captive portal net), another consideration is that AccessPoint autentication must be open.
A valid network desing can be:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/NetwordDiagram.PNG)

The majority of captive portals are designed to work without SSL certificate (https login portal) for default, the newer PC version of chrome and firefox, dont support pfsense autosign Cert so in windows PC you can open iexplorer and try to navigate, when a certificate caution appers, add insecure certificate and captive portal will allow internet access.
 **However**, when a mobile devices is connected to AP, OS (android or IOS) detects Captive Portal configuration and popup a screen with login page.
"Auto" login page:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/loginPage.jpg)

Input personal information:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/loginPage_inputInfo.jpg)

Saved record and internet allow
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/loginPage_userRegistered.jpg)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/LoginPage_InternetAllow.jpg)

Finally, add a email report sended by captive portal.
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/email_report_shcedule.jpg)

> Written with [StackEdit](https://stackedit.io/).
