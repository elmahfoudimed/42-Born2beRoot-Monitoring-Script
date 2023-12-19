#!/bin/bash

# OS Architecture
arch=$(uname -a)

# CPU && vCPU
pcpu=$(lscpu | awk '/Socket/ {print $2}')
vcpu=$(lscpu | awk '/^CPU\(s\)/ {print $2}')

# Available RAM
tram=$(free -m | awk '/Mem/ {print $2}')
uram=$(free -m | awk '/Mem/ {print $3}')
pram=$(free -m | awk '/Mem/ {printf("%.2f", $3 / $2 * 100)}')

# Available Memory
tdisk=$(df -Bg | awk '/^\/dev\// && !/boot/ {total += $2} END {print total}')
udisk=$(df -Bm | awk '/^\/dev\// && !/boot/ {used += $3} END {print used}')
pdisk=$(df -Bm | awk '/^\/dev\// && !/boot/ {total += $2} {used += $3} END {printf("%d", used / total *100)}')

# CPU Usage
cpul=$(top -bn1 | awk '/^%Cpu/ {printf("%.1f", $2 + $4)}')

# Date and Time of the last Reboot
lreb=$(who -b | awk '{print $3,$4}')

# Check LVM
lvm=$(lsblk | grep "lvm" | wc -l)
lvmu=$(if [ $lvm -eq 0 ]; then echo no; else echo yes; fi)

# Connections TCP
ctcp=$(cat /proc/net/tcp | grep -v 'local' | wc -l)

# User log
ulog=$(who | awk '{print $1}' | sort -u | wc -l)

# IPv4 and MAC Addresses
ipv4=$(hostname -I)
mac=$(ip link | awk '/link\/ether/ {print $2}')

# Sudo
sudo=$(journalctl -q | grep COMMAND | grep sudo | wc -l)

# Output
wall "	#Architecture: $arch
	#CPU physical: $pcpu
	#vCPU: $vcpu
	#Memory Usage: $uram/${tram}MB ($pram%)
	#Disk Usage: $udisk/${tdisk}Gb ($pdisk%)
	#CPU load: ${cpul}%
	#Last boot: $lreb
	#LVM use: $lvmu
	#Connections TCP: $ctcp ESTABLISHED
	#User log: $ulog
	#Network: $ipv4 ($mac)
	#Sudo: $sudo cmd  "
