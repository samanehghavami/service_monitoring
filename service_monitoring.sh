#!/bin/bash
SERVICES=(nginx,httpd,java)
for service in ${SERVICES[@]}; do
  if systemctl list-units --all --full | grep service ; then
    service_name=$(cat /tmp/service | awk '^.' print{$2})
    
