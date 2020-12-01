#!/bin/bash

# 
echo "[TASK 1] Installing haproxy "
sudo yum install haproxy

# creating a docker registry
cat >>haproxy/haproxy.cfg <<EOF

frontend kubernetes-frontend
    bind 192.200.2.1:6443
    mode tcp
    option tcplog
    default_backend kubernetes-backend

backend kubernetes-backend
    mode tcp
    option tcp-check
    balance roundrobin
    server master 192.200.1.1:6443 check 
    server master1 192.200.1.2:6443 check 

EOF

#Restart haproxy service
systemctl restart haproxy