#!/bin/sh
# To visit intranet and Internet  for CQUPT macOS users
# Note: Once your gateway changes, you should re-execute this script again, 
# like when you come back to dorm from lab.
############################################################################################

# first of all, decide which network device is connected to the intranet, for me it is 'en4'
dev_intra='en4'
# then find the gateway of this device
gw_intra=`netstat -rn | grep 'default'|grep $dev_intra|awk '{print $2}'`

echo "[*] Gateway for $dev_intra is $gw_intra"
# at last, add route
add_route()
{
    sudo route -n add 172.16.0.0/12     $gw_intra
    sudo route -n add 202.202.32.0/20   $gw_intra
    sudo route -n add 211.83.208.0/20   $gw_intra
    sudo route -n add 222.177.140.0/25  $gw_intra
    sudo route -n add 219.153.62.64/26  $gw_intra
    sudo route -n add 10.10.10.0/24     $gw_intra
    sudo route -n add 192.168.0.0/24    $gw_intra
}

echo "[*] Adding route..."
add_route > /dev/null
echo "[*] Route added. Now you can visit intranet and Internet!"
exit 0
