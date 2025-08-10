#!/bin/bash

echo "🚀 Starting ClayModel..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop or Docker daemon."
    exit 1
fi

# Create directories
mkdir -p data cache

# Start container
echo "Starting container..."
docker-compose up -d claymodel-jupyter

# Wait for container to start
sleep 3

# Check if running
if docker ps | grep -q claymodel-jupyter; then
    echo "✅ ClayModel is running!"
    echo "🌐 Open: http://localhost:8888"
    echo "📊 Open: data_process.ipynb"
else
    echo "❌ Failed to start. Check logs with: docker-compose logs claymodel-jupyter"
    exit 1
fi
