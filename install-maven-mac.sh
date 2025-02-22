#!/bin/bash

# Define installation path
MAVEN_PATH="$HOME/Documents/maven"

# Create Maven directory
mkdir -p "$MAVEN_PATH"
echo "Maven directory created: $MAVEN_PATH"

# Get latest Maven version
MAVEN_URL="https://dlcdn.apache.org/maven/maven-3/"
LATEST_VERSION=$(curl -s "$MAVEN_URL" | grep -o '3\.[0-9]\+\.[0-9]\+/' | tail -1 | tr -d '/')

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

# Create or update .zshrc entries (macOS Catalina and later use zsh by default)
ZSHRC="$HOME/.zshrc"

# Remove old entries if they exist
sed -i.bak '/export MAVEN_HOME=/d' "$ZSHRC"
sed -i.bak '/export M2_HOME=/d' "$ZSHRC"
sed -i.bak '/export PATH=.*maven/d' "$ZSHRC"
rm -f "$ZSHRC.bak"

# Add new entries
echo "export MAVEN_HOME=$MAVEN_HOME" >> "$ZSHRC"
echo "export M2_HOME=$MAVEN_HOME" >> "$ZSHRC"
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> "$ZSHRC"

echo "Maven $LATEST_VERSION has been installed!"
echo "Installation Path: $MAVEN_HOME"
echo "Please restart your terminal or run 'source ~/.zshrc' for the changes to take effect."

# Test the installation
export PATH="$MAVEN_HOME/bin:$PATH"
mvn -version