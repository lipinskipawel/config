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

java() {
  echo "Download java"
  echo "To install java use fish functions like jls, jdk"
  curl -fsSL \
    https://api.temurin.net/v3/binary/latest/17/ga/linux/x64/jdk/hotspot/normal/eclipse?project=jdk \
    --output temurin-17.0.4.tar.gz

  mkdir -p temurin-17.0.4

  echo "Extract archive"
  tar xf temurin-17.0.4.tar.gz -C temurin-17.0.4 --strip-components=1
  mkdir -p $HOME/.jdks
  mv temurin-17.0.4 $HOME/.jdks/

  echo "Removing archive"
  rm -rf temurin-17.0.4.tar.gz
}

docker
java

