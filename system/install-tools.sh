#!/bin/bash

echo "Installing tools"

docker() {
  echo "Install docker"
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  sudo groupadd docker
  sudo usermod -aG docker $USER

  echo "Start docker on boot time"
  echo "sudo systemctl enable docker.service"
  echo "sudo systemctl enable containerd.service"

  echo "To uninstall docker engine"
  echo "sudo apt purge docker-ce docker-ce-cli containerd.io docker-compose-plugin"
  echo "sudo rm -rf /var/lib/docker"
  echo "sudo rm -rf /var/lib/containerd"
}

docker

