#!/bin/bash

#dhclient -v eth0

ip=$(ifconfig eth0 | awk -F"addr:" '/inet addr/{print $2}'|sed 's/ Bcast.*//')
ipmi=$(ipmitool lan print | grep "IP Address" | grep -v "Source"| sed 's/IP Address.*://')
echo "Hi, this is a mail from $HOSTNAME server [nVidia K20]

Server has rebooted few minutes ago. 
Now my IP is:  $ip
My IPMI ip is: $ipmi" | mail -s "Server \"$HOSTNAME\" changed IP" iznam@yandex-team.ru
