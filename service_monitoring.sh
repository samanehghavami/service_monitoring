#!/bin/bash
SERVICES=(nginx httpd sshd)
for service in ${SERVICES[@]}; do
  if systemctl list-units --all --full | grep $service ; then
    systemctl status $service > /tmp/service
    service_name=awk 'NR == 1 print{$2}' /tmp/service
    status=awk 'NR == 3 print{$2}' /tmp/service
    memoryusage=awk 'NR == 7 print{$2}' /tmp/service
    cpuusage=awk 'NR == 8 print{$2}' /tmp/service
    msg+="service:$service_name is $status cpu usage:$cpuusage memory usage:$memoryusage \n"
  else
    echo "service not found"
  fi
done
echo -e $msg
    
    
