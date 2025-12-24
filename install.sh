#!/bin/bash

set -e

echo "========================================"
echo "Updating system packages..."
echo "========================================"
sudo apt update -y && sudo apt upgrade -y

echo "========================================"
echo "Installing Git..."
echo "========================================"
sudo apt install -y git

echo "Git version:"
git --version

echo "========================================"
echo "Installing Docker dependencies..."
echo "========================================"
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "========================================"
echo "Adding Docker GPG key..."
echo "========================================"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "========================================"
echo "Adding Docker repository..."
echo "========================================"
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "========================================"
echo "Installing Docker Engine..."
echo "========================================"
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "========================================"
echo "Enabling Docker service..."
echo "========================================"
sudo systemctl start docker
sudo systemctl enable docker

echo "========================================"
echo "Adding current user to docker group..."
echo "========================================"
sudo usermod -aG docker $USER

echo "========================================"
echo "Docker version:"
echo "========================================"
docker --version

echo "========================================"
echo "Installation completed successfully!"
echo "Log out & log in again to use Docker without sudo."
echo "========================================"
