# Automatic Maven Installer

This PowerShell script automatically downloads and installs the latest version of Apache Maven on Windows systems. The script sets up Maven in the user's Documents folder and configures all necessary environment variables.

## Features

- Automatically downloads the latest Maven version
- Installs Maven in the user's Documents folder (`<User>/Documents/maven/`)
- Sets up all required environment variables (MAVEN_HOME, M2_HOME, PATH)
- Verifies the installation
- Cleans up temporary files
- Provides detailed feedback during installation

## Prerequisites

- Windows operating system
- PowerShell 5.1 or higher
- Internet connection
- Administrator privileges (for script execution)

## Installation

1. Clone this repository:
   ```powershell
   git clone https://github.com/yourusername/maven-installer.git
   ```

2. Navigate to the script directory:
   ```powershell
   cd maven-installer
   ```

3. If needed, unblock the script:
   ```powershell
   Unblock-File -Path .\install-maven.ps1
   ```

4. Run the script:
   ```powershell
   .\install-maven.ps1
   ```

## What the Script Does

1. Creates a Maven directory in your Documents folder
2. Downloads the latest Maven version from the official Apache website
3. Extracts the Maven files
4. Sets up the following environment variables:
   - MAVEN_HOME
   - M2_HOME
   - Adds Maven's bin directory to PATH
5. Verifies the installation by running `mvn -version`

## After Installation

After the script completes:
1. Restart your PowerShell/Command Prompt
2. Verify the installation by running:
   ```powershell
   mvn -version
   ```

## Troubleshooting

If you encounter any issues:

1. **Execution Policy Error**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```

2. **Access Denied**
   - Make sure you're running PowerShell as Administrator

3. **Download Issues**
   - Check your internet connection
   - Verify that https://dlcdn.apache.org is accessible

## Contributing

We welcome contributions to improve the Maven installer! Here's how you can help:

### Contributing Guidelines

1. Fork the repository [Contrum/install-maven](https://github.com/Contrum/install-maven)
2. Clone your fork locally
   ```bash
   git clone https://github.com/your-username/install-maven.git
   ```
3. Create a new branch for your feature
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. Make your changes
   - Keep the code style consistent
   - Ensure the GitHub Action workflow passes

5. Commit your changes using clear commit messages
   ```bash
   git commit -m "Add: description of your changes"
   ```
6. Push to your fork
   ```bash
   git push origin feature/your-feature-name
   ```
7. Open a Pull Request to the `main` branch of [Contrum/install-maven](https://github.com/Contrum/install-maven)
   - Provide a clear description of your changes
   - Reference any related issues

### Development Setup

1. Ensure you have PowerShell 5.1 or higher installed
2. Set execution policy for development:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```
3. Test your changes locally before submitting a PR

### Report Issues

Found a bug or have a suggestion? Please open an issue:
1. Go to [Issues](https://github.com/Contrum/install-maven/issues)
2. Click "New Issue"
3. Provide a clear description and steps to reproduce if applicable

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.