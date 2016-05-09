#!/bin/sh
# /**
# * Authentication to OpenVpn
# *
# * @subpackage Bash Script
# * @name vpnauth.sh
# * @author Fabio Lima <fabioolima at gmail.com>
# * @since 2016-06-05
# * @version 1.0.0
# * @license MIT
# */


authfile="/etc/openvpn/users/ovpnauth-pwd"

crypto(){
        echo "$1 $(uname -mno)" > /dev/shm/$$.crypt
        result=$(sha256sum /dev/shm/$$.crypt | awk '{print $1}')
        rm /dev/shm/$$.crypt
        echo $result
}

addUser(){
        if [ $(grep -i $1 $authfile) ]
        then
            echo "Usuário Já existe !/n"
        else
            echo "Digite a senha:"
            read -s passwd
            passwd=$(crypto $passwd)
            echo "$1=$passwd" >> $authfile
            echo "Usuário criado"
        fi
        exit 1
}

showHelp(){
        echo "vpnauth - OpenVPN sh authentication script"
        echo ""
        echo "-h prints help"
        echo "-c <username> - to create a new user"
        exit 1
}

while getopts c:h op; do
        case "${op}" in
                c) addUser ${OPTARG} ;;
                h) echo "Show Help" ;;
        esac
done

passfile=$(cat $1)
username=$(echo $passfile | awk '{print $1}')
password=$(echo $passfile | awk '{print $2}')

password=$(crypto $password)
passfile=$(cat $authfile | grep $username= | awk -F= '{print $2}')
if [ "$password" = "$userpass" ]
then
        exit 0
fi
