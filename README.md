## email Marketing with pfsense PortalCautive

This project is a little fork of pfsense Cautive Portal module, this project allows to Cautive Portal shown a form with a Name, e-mail and celular phone, in order to gives internet services to clients, later saves this information into a My-SQL database and finally sends a report of login users to a email list for marketing purposes.

To built this implementation, follow next steps.

 1. Download oficial pfsense 2.4.4p3 from oficial [page.](https://www.pfsense.org/download/)
 2. Install pfsense in to your favorite environment, i use in this case [Oracle VirtualBox](https://www.virtualbox.org/)
 3. Follow [this instructions](https://www.youtube.com/watch?v=tJaCiCauzoE) to enable Cautive Portal with SSL autentication, at the end, ensure that your instalation looks like this:
	 - [ ] Name and domain should be same domainName that will configure in CA cert:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_GeneralSetup.png)
	 - [ ]  Your configured local CA will looks like this in order to allow select certificate in to Portal Cautive configuration :
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_CA_SSL_Cert.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_CA_SSL_Cert_2.png)

	 - [ ] Enable DSN forwarder feature to allow this server resolve internet domain names:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DNS_Forwarder_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DNS_Forwarder_2.png)

	 - [ ] Enable DHCP server according to your needs
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DHCP.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautive_DHCP_2.png)

	 - [ ] Finally, Captive Portal configuration should be like this:
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_1.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_2.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_3.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_4.png)
![enter image description here](https://raw.githubusercontent.com/dhvilleg/pfsense_portalCautive_emailMarketing/master/images/PortalCautivePortalCautive_5.png)

 5. 

> Written with [StackEdit](https://stackedit.io/).
