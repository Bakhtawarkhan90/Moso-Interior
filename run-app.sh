#!/bin/bash

# Downloading Docker and Docker Compose
echo "****************************** Installing Docker and Docker Compose **************************"
sudo apt update && sudo apt-get install -y docker.io
sudo apt-get install docker-compose-v2

# Adding the currently logged-in user and Jenkins user to the Docker group
echo "****************************** Adding users to Docker group **************************"
sudo chown $USER /var/run/docker.sock
sudo usermod -aG docker $USER && sudo apt update  -y

# Verify Installation
echo "**************************DOCKER VERSION***************************"
sudo docker --version
echo "*********************DOCKER-COMPOSE VERSION*************************"
sudo docker compose version

# Running project in one goo
echo "**************************RUNNING PROJECT*************************** "
git clone https://github.com/Bakhtawarkhan90/Moso-Interior.git
cd /home/ubuntu/Moso-Interior
docker compose down
docker compose up --build -d

echo "##############################################################################################################################################"

echo "************************** NOW YOU CAN ACCESS APP ON PORT 5000 *************************** "

echo "##############################################################################################################################################"
