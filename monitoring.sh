#!/bin/bash

     ARCH=$(uname -a)
      CPU=$(nproc)
     vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEM_USING=$(free | grep Mem: | awk '{print $3/1000}' | sed 's/\([0-9]\)\..*$/\1/g' )
MEM_TOTAL=$(free | grep Mem: | awk '{print $2/1000}' | sed 's/\([0-9]\)\..*$/\1/g' )
MEM_PCENT=$(free | grep Mem: | awk '{print $3/$2 * 100}' | sed 's/\(\.[0-9][0-9]\).*$/\1/g')
DSK_USING=$(df --total -BG | awk 'END{print $3}' | sed 's/G//g')
DSK_TOTAL=$(df --total -BG | awk 'END{print $2}')
DSK_PCENT=$(df --total -BG | awk 'END{print $5}')
 CPU_LOAD=$(top -n1 | grep %Cpu | awk '{print $2}') 
LAST_BOOT=$(who --boot | awk '{print $3 " " $4}')
LVM_COUNT=$(cat /etc/fstab | grep mapper | wc -l)
  LVM_USE=no
if [ $LVM_COUNT -gt 0 ]; then 
	LVM_USE=yes
fi
TCP_CONNE=$(netstat -nat | grep ESTABLISHED | wc -l)
 USER_LOG=$(who --users | wc -l)
  IP_ADDR=$(ip addr show enp0s3 | sed -n '3'p | awk '{print $2}')
 MAC_ADDR=$(ip addr show enp0s3 | sed -n '2'p | awk '{print $2}')
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

