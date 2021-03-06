bug 2015-09-01
=================
* there is a bug in the code counting the available updates. The 90+ updates have been in 
the development branch but not in the release branch. Applying the update will only reset the counter since there are no release updates.
Will try to get a fix out soonish....

update 2015-05-12
=================
* had some time to work on the new manual. still a mess but it is slowly getting there.    
  The new manual can be found under "Tools"

updated 2015-05-10
==================
* added configuration option to allow incoming SNMP traffic through the firewall. This setting is disabled by default.

update 2015-05-06
=================
* **WARNING** major changes! Don't update yet unless you want to use the latest and greatest features. PLEASE REPORT ANY ISSUES!!!!
* removed most of the code that binds PIA-Tunnel to PrivateInternetAccess.com.      
  It should be possible to use this VM with most VPN providers soon.
* PrivateInternetAccess.com: added openVPN files for TCP and UDP connections.     
  UDP may be enabled in "General Settings" => "VPN Provider"
* ALL connections are now prefixed with a custom provider prefix. "PIAtcp/France" will create a TCP VPN tunnel to France and "PIAudp/France" will do the same using the UDP protocol.
* this update breaks your current PIA-Daemon configuration. You need to set new failover locations (Settings).
* the new changes may break some CMD line tools. I'll have to rewrite some parts to support the new dynamic format.


update 2015-04-28
=================
* I have received reports that a recent update degraded VPN performance for high speed connections (+1MB/s). The issue appears to be caused by a switch from a UDP to a TCP based VPN connections.      
I will implement an option to select which protocol to use ASAP. 



update 2015-04-08
=================
* sry for the delay. This updates the connection files to match PIA's latest changes. VPN should work once again.    
  Please logout of the webUI to update your list of available VPN locations.

update 2015-04-04
=================
* their appears to be an issue with keeping a VPN connection up when there is more then a few KB of load on the
  tunnel. I suspect the issue is related to the latest openSSL bugs and the resulting patches. I will investigate ASAP.

update 2015-03-21
=================
* added an alternative SOCKS5 server package "3proxy" for i686 and arm6l. Looks like this one handles load a bit better.
  Please report any issues or if it improves performance.    
  Ensure the proxy server is not running then switch the software under "Settings" => "SOCKS 5 Proxy Server".

update 2015-03-20
=================
* The old SOCKS5 server configuration was verbose for testing. This is not required anymore and
  has been changed with last release. Please disable the SOCKS5 server on at least one interface
  to generate a new configuration file.  
  The current log file could be quite large. You may login as root and execute the following command to clear it.   
  echo "" >  /var/log/sockd.log
* Do not connect both network interfaces to the same network or use IPs in the same range!
  I have been working on the documentation and noticed that the VPN may not connect
  when both adapters are connected to the same network. In my case em0 was set to 192.168.1.240
  and em1 to 192.168.1.25 with a subnet of 255.255.255.0   
  Changing em1 to 192.168.2.25 and disconnecting the network cable appears to have fixed it.
* retrieving this list before an update should work now ,,,
* few updates to the new manual
  
  
  
update 2015-03-16
======================
* added release notes to the update client - this box.  
  These notes are updated before you apply an update and will list any important changes.
* Optimized javascript on "Overview" page
* Added "Refresh Overview" setting to control the refreshing interval of the overview page
* Added Ping Utility to "Tools"
* webUI will be reloaded automatically from "Rebooting VM...." page
* Updated SOCKS5 server to dante 1.4.1
* Few optimizations here and there....
* Added [Parsedown](http://parsedown.org/) to help generate these notes
* Working on a new Documentation. Link under "Tools" or [New Manual](./docs/index.html)
  Special thanks to Alan Diamond for rescuing the documentation from the grips of Microsoft ;)
* Added support for the Raspberry Pi 1 Model B+ and probably other ARM based devices. This is still experimental but it looks very promising.  
The RasbPi will act as a stand alone VPN router for you network with support for all PIA-Tunnel features.  
[Rasberry Pi Setup Instructions](./docs/index.html#pi_setup). These will be turned into an installation script later on.
