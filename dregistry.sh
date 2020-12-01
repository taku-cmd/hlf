#!/bin/bash

# creating a Docker private Registry
echo "[TASK 1] creating a Docker private Registry"

sudo yum install docker 
systemctl enable docker
systemctl start docker 

# commands to add docker to sudoers
    sudo usermod -aG docker ${USER}
    su - ${USER}


# creating a docker registry
cat >>docker compose.yaml <<EOF

version: '3'

services:
    docker-registry:
        container_name: docker-registry
        image: registry:2
        ports:
            - 5000:5000
        restart: always
        volumes:
            - ./volume:/var/lib/registry
    docker-registry-ui:
        container_name: docker-registry-ui
        image: konradkleine/docker-registry-frontend:v2
        ports:
            - 8081:80
        environment:
            ENV_DOCKER_REGISTRY_HOST: docker-registry
            ENV_DOCKER_REGISTRY_PORT: 5000

EOF

# Buil docker-registry 

 docker-compose up -d
 
 # install gitlab-runner 
  
sudo yum install gitlab-runner


