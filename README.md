# VPNAuth

VPNAuth is an authentication script to Openvpn, can be used in the _auth-user-pass-verify_ option and _via-file_. [Openvpn](https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage)

  - Type some Markdown on the left
  - See HTML in the right
  - Magic


### Version
1.0
### Installation

```sh
$ cp ~/vpnauth.sh /etc/openvpn/vpnauth.sh
$ chmod +x /etc/openvpn/vpnauth.sh
# Edit your server configuration
# auth-user-pass-verify "/etc/openvpn/vpnauth.sh" via-file
$ /etc/openvpn/vpnauth.sh -c <user_name>
``` 
License
----

 - MIT

