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

rust() {
  echo "Install rust"
  curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs --output rust-install.sh
  chmod +x rust-install.sh
  ./rust-install.sh -y --no-modify-path
  rm -rf rust-install.sh
}

gradle() {
  echo "Install gradle"
  curl --proto '=https' -tlsv1.2 -fsSL "https://services.gradle.org/distributions/gradle-7.5.1-all.zip" \
    --output gradle-7.5.1-all.zip

  unzip gradle-7.5.1-all.zip
  mv gradle-7.5.1 /home/pawel/.tools

  rm -rf gradle-7.5.1-all.zip
  chmod +x /home/pawel/.tools/gradle-7.5.1/bin/gradle
  ln -s /home/pawel/.tools/gradle-7.5.1/bin/gradle /home/pawel/.local/bin/gradle
}

idea() {
  echo "Install Intellij Idea"
  curl --proto '=https' -tlsv1.2 -fsSL "https://download.jetbrains.com/idea/ideaIC-2021.3.3-no-jbr.tar.gz" \
    --output idea-2021.3.3-no-jbr.tar.gz

  tar xf idea-2021.3.3-no-jbr.tar.gz -C idea-2021.3.3 --strip-components=1
  mv idea-2021.3.3 /home/pawel/.tools/idea-2021.3.3

  rm -rf idea-2021.3.3-no-jbr.tar.gz
  chmod +x /home/pawel/.tools/idea-2021.3.3/bin/idea.sh
  ln -s /home/pawel/.tools/idea-2021.3.3/bin/idea.sh /home/pawel/.local/idea
}

docker
java
rust
gradle
idea

