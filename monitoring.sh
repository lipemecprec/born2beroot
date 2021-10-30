#!/bin/bash

     ARCH=$(uname -a 2> /dev/null)
      CPU=$(nproc 2> /dev/null)
     vCPU=$(cat /proc/cpuinfo | grep processor | wc -l 2> /dev/null)
MEM_USING=$(free | grep Mem: | awk '{print $3/1000}' | sed 's/\([0-9]\)\..*$/\1/g' 2> /dev/null)
MEM_TOTAL=$(free | grep Mem: | awk '{print $2/1000}' | sed 's/\([0-9]\)\..*$/\1/g' 2> /dev/null)
MEM_PCENT=$(free | grep Mem: | awk '{print $3/$2 * 100}' | sed 's/\(\.[0-9][0-9]\).*$/\1/g'2> /dev/null)
DSK_USING=$(df --total -BG | awk 'END{print $3}' | sed 's/G//g' 2> /dev/null)
DSK_TOTAL=$(df --total -BG | awk 'END{print $2}' 2> /dev/null)
DSK_PCENT=$(df --total -BG | awk 'END{print $5}' 2> /dev/null)
 CPU_LOAD=$(top -n1 | grep %Cpu | awk '{print $2}' 2> /dev/null) 
LAST_BOOT=$(who --boot | awk '{print $3 " " $4}' 2> /dev/null)
LVM_COUNT=$(cat /etc/fstab | grep mapper | wc -l 2> /dev/null)
  LVM_USE=no
if [ $LVM_COUNT -gt 0 ]; then 
	LVM_USE=yes
fi
TCP_CONNE=$(netstat -nat | grep ESTABLISHED | wc -l 2> /dev/null)
 USER_LOG=$(who --users | wc -l 2> /dev/null)
  IP_ADDR=$(ip addr show enp0s3 | sed -n '3'p | awk '{print $2}' 2> /dev/null)
 MAC_ADDR=$(ip addr show enp0s3 | sed -n '2'p | awk '{print $2}' 2> /dev/null)
SUDO_COMM=$(($(journalctl _COMM=sudo | grep sudo | wc -l) / 3))

wall "#Architecture	: ${ARCH} 
#CPU physical	: ${CPU}
#vCPU		: ${vCPU}
#Memory Usage	: ${MEM_USING}/${MEM_TOTAL}MB (${MEM_PCENT}%)
#Disk Usage	: ${DSK_USING}/${DSK_TOTAL}b (${DSK_PCENT})
#CPU load	: ${CPU_LOAD}%
#Last boot	: ${LAST_BOOT}
#LVM use	: ${LVM_USE}
#Connexions TCP	: ${TCP_CONNE} ESTABLISHED
#User log	: ${USER_LOG}
#Network	: IP ${IP_ADDR} (${MAC_ADDR})
#Sudo		: ${SUDO_COMM} cmd"

