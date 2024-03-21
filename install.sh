#!/bin/bash


sudo apt update -y

# check docker
if [ -x "$(command -v docker)" ]; then
    echo "Docker was installed. Continue..."
    # command
else
    echo "Install docker"
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
fi
# kill process using port
sudo kill -9 $(lsof -t -i:80)
sudo kill -9 $(lsof -t -i:8081)
sudo kill -9 $(lsof -t -i:8080)
docker-compose up -d --build
echo "wait for services startup and import database"
sleep 30
docker-compose exec -T db-cc mysql -uroot -pVkm#1234 noderatio < $PWD/Installer/docker/noderatio.sql
