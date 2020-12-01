#!/bin/bash

# Join Master1 to the Kubernetes cluster
echo "[TASK 1] Join master1 to Kubernetes Cluster"
yum install -q -y sshpass >/dev/null 2>&1
sshpass -p "kubeadmin" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no master.example.com:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1
