#!/bin/bash

# Check if the repo URL is provided
if [ -z "$1" ]; then
    echo "Usage: ./setup.sh <repository_url>"
    exit 1
fi

# Install pip, pipenv, localstack, and localstack-client
echo "Installing pip, pipenv, localstack, and localstack-client..."
pip install pipenv localstack localstack-client

# Clone the repository
echo "Cloning the repository..."
git clone "$1"
repo_dir=$(basename "$1" .git)
cd "$repo_dir" || exit

# Set up the pipenv virtual environment and install dependencies
echo "Setting up the virtual environment and installing dependencies..."
pipenv install

# Install boto3 for LocalStack integration
echo "Installing boto3 for LocalStack integration..."
pipenv install boto3

# Make the start.sh script executable
echo "Making the start.sh script executable..."
chmod +x start.sh

echo "Setup complete. You can now run the Django application using LocalStack by running:"
echo "  pipenv shell"
echo "  ./start.sh"
