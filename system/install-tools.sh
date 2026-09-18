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
  local version="${1:-9.7.1}"

  if [[ -z "$version" ]]; then
      echo "Usage: gradle <version>"
      return 1
  fi

  echo "Install gradle $version"

  local archive="gradle-${version}-all.zip"
  local dir="gradle-${version}"
  local install_dir="/home/pawel/.tools/${dir}"

  curl --proto '=https' --tlsv1.2 -fsSL \
    "https://services.gradle.org/distributions/${archive}" \
    --output "$archive"

  unzip "$archive"
  mv "$dir" /home/pawel/.tools

  rm -f "$archive"
  chmod +x "${install_dir}/bin/gradle"
  ln -sfn "${install_dir}/bin/gradle" /home/pawel/.local/bin/gradle
}

idea() {
  echo "Install Intellij Idea"
  curl --proto '=https' -tlsv1.2 -fsSL "https://download.jetbrains.com/idea/ideaIC-2023.2.4.tar.gz" \
    --output idea-2023.2.4.tar.gz

  tar xf idea-2023.2.4.tar.gz -C idea-2023.2.4 --strip-components=1
  mv idea-2023.2.4 /home/pawel/.tools/idea-2023.2.4

  rm -rf idea-2023.2.4.tar.gz
  chmod +x /home/pawel/.tools/idea-2023.2.4/bin/idea.sh
  ln -s /home/pawel/.tools/idea-2023.2.4/bin/idea.sh /home/pawel/.local/bin/idea
}

docker
java
rust
gradle 9.7.1
idea

