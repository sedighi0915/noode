#!/bin/bash

# Update and upgrade packages
apt-get update
apt-get upgrade -y

# Install required packages
apt-get install curl socat git -y

# Install Docker
curl -fsSL https://get.docker.com | sh

# Clone the repository
git clone https://github.com/Gozargah/Marzban-node

# Create necessary directories
mkdir -p /var/lib/marzban-node

# Change to the repository directory
cd Marzban-node

# Create docker-compose.yml
cat <<EOF > docker-compose.yml
services:
  marzban-node-1:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_1.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "2000:62050"
      - "2001:62051"
      - "8032:8032"
      - "8443:8443"
      - "2030:2030"

  marzban-node-2:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_2.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "3000:62050"
      - "3001:62051"
      - "2065:2065"
      - "2150:2150"
      - "6985:6985"
      - "6358:6358"

  marzban-node-3:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_3.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "4000:62050"
      - "4001:62051"
      - "2067:2067"
      - "9785:9785"
      - "2087:2087"

  marzban-node-4:
    image: gozargah/marzban-node:latest
    restart: always
    environment:
      - SSL_CLIENT_CERT_FILE=/var/lib/marzban-node/ssl_client_cert_4.pem
    volumes:
      - /var/lib/marzban-node:/var/lib/marzban-node
      - /var/lib/marzban:/var/lib/marzban
    ports:
      - "5000:62050"
      - "5001:62051"
      - "2096:2096"
      - "22850:22850"
      - "1515:1515"
      - "1616:1616"
EOF

# Create SSL client certificates
echo "سرتیف1" > /var/lib/marzban-node/ssl_client_cert_1.pem
echo "سرتیف2" > /var/lib/marzban-node/ssl_client_cert_2.pem
echo "سرتیف3" > /var/lib/marzban-node/ssl_client_cert_3.pem
echo "سرتیف4" > /var/lib/marzban-node/ssl_client_cert_4.pem

# Start Docker Compose
docker compose up -d
