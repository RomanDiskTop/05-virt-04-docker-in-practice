#!/bin/bash

set -e 
# Обновляем список пакетов и устанавливаем Git (если не установлен)
apt-get update && apt-get install -y git

# Клонируем fork репозитория в /opt
REPO_DIR="/opt/shvirtd-example-python"
REPO_URL="https://github.com/RomanDiskTop/shvirtd-example-python.git"

if [ -d "$REPO_DIR" ]; then
    cd "$REPO_DIR"
    git pull origin main
else
    git clone "$REPO_URL" "$REPO_DIR"
    cd "$REPO_DIR"
fi
docker compose up -d
sleep 20
docker compose ps


