#!/bin/bash

# By Stamate Valentin on 04.03.2023 12:11
# For Ubuntu 22.04
# Before running this script give it execute permissions: chmod +x ./install.sh

GREEN='\033[0;32m'
WHITE='\033[0;37m'

sudo -l

sudo apt update && sudo apt upgrade -y

# Utils
echo -e "\n ${GREEN}Installing utils...${WHITE}"
sudo apt install -y vim libfuse2 cmake curl net-tools
sudo apt install build-essential

# Git
echo -e "\n${GREEN}Installing Git${WHITE}"
sudo apt-get install -y git
git config --global credential.helper store
git config --global init.defaultBranch main

# Docker
echo -e "\n${GREEN}Installing Docker...${WHITE}"
sudo apt update -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo rm /usr/share/keyrings/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

# Node 20LTS
echo -e "\n${GREEN}Installing node 20 lts...${WHITE}"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs

# Angular
echo -e "\n${GREEN}Installing Angular...${WHITE}"
npm install -g @angular/cli

# Fix time problem on dual boot
echo -e "\n${GREEN}Fixing bual boot clock issue...${WHITE}"
timedatectl set-local-rtc 1

sudo apt update -y

echo -e "\n${GREEN}Done${WHITE}"

