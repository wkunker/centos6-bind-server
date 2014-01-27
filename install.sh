#!/bin/sh
IPADDR=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
KEYNAME="wkunker.gmail.com."
ZONENAME="testzone.apt"
HARDWAREADDR=$(ifconfig | grep eth0 | awk '{print $5}')
SECRET="W1pKPv4jdMORzJscYtxm8EL47QVQEa4MncqRod/Sr6TF1GbzgiB0Fuu2lEnMH0WLBtJBtYgVZtQfPm+9uA=="
yum install -y bind bind-utils
find install -type f -print0 | xargs -0 sed -i "s/192.168.1.2/$IPADDR/g"
sed -i "s/key wkunker.gmail.com./$KEYNAME/g" install/etc/named.conf
sed -i "s/key wkunker.gmail.com./$KEYNAME/g" install/var/named/keys.conf
sed -i "s/secret *$/secret \"$SECRET\"/g" install/var/named/keys.conf
sed -i "s/search testzone.apt/search $ZONENAME/g" install/etc/resolv.conf
sed -i "s/^HWADDR=*$/HWADDR=$HARDWAREADDR/g" install/etc/sysconfig/network-scripts/ifcfg-eth0
service named start
service named stop
service iptables stop
#cp -rf install/* /
service iptables start
service named start

