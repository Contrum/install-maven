#!/bin/bash

# Define installation path
MAVEN_PATH="$HOME/Documents/maven"

# Create Maven directory
mkdir -p "$MAVEN_PATH"
echo "Maven directory created: $MAVEN_PATH"

# Get latest Maven version
MAVEN_URL="https://dlcdn.apache.org/maven/maven-3/"
LATEST_VERSION=$(curl -s "$MAVEN_URL" | grep -oP '3\.\d+\.\d+/' | tail -1 | tr -d '/')

if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not determine latest Maven version"
    exit 1
fi

# Download Maven
echo "Downloading Maven $LATEST_VERSION..."
DOWNLOAD_URL="${MAVEN_URL}${LATEST_VERSION}/binaries/apache-maven-${LATEST_VERSION}-bin.tar.gz"
curl -L "$DOWNLOAD_URL" -o "$MAVEN_PATH/maven.tar.gz"

# Extract Maven
echo "Extracting Maven..."
tar -xzf "$MAVEN_PATH/maven.tar.gz" -C "$MAVEN_PATH"
rm "$MAVEN_PATH/maven.tar.gz"

# Get the extracted directory name
MAVEN_HOME="$MAVEN_PATH/apache-maven-$LATEST_VERSION"

# Setup environment variables
echo "Setting up environment variables..."

# Create or update .bashrc entries
BASHRC="$HOME/.bashrc"
PROFILE="$HOME/.profile"

# Remove old entries if they exist
sed -i '/export MAVEN_HOME=/d' "$BASHRC"
sed -i '/export M2_HOME=/d' "$BASHRC"
sed -i '/export PATH=.*maven/d' "$BASHRC"

# Add new entries
echo "export MAVEN_HOME=$MAVEN_HOME" >> "$BASHRC"
echo "export M2_HOME=$MAVEN_HOME" >> "$BASHRC"
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> "$BASHRC"

# Also update .profile for non-login shells
cp "$BASHRC" "$PROFILE"

echo "Maven $LATEST_VERSION has been installed!"
echo "Installation Path: $MAVEN_HOME"
echo "Please restart your terminal or run 'source ~/.bashrc' for the changes to take effect."

# Test the installation
export PATH="$MAVEN_HOME/bin:$PATH"
mvn -version