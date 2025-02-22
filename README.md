# Automatic Maven Installer

This repository provides scripts for automatically downloading and installing the latest version of Apache Maven on Windows, Linux, and macOS systems. Each script sets up Maven in the user's Documents folder and configures all necessary environment variables.

## Features

- Automatically downloads the latest Maven version
- Installs Maven in the user's Documents folder (`<User>/Documents/maven/`)
- Sets up all required environment variables (MAVEN_HOME, M2_HOME, PATH)
- Verifies the installation
- Cleans up temporary files
- Provides detailed feedback during installation
- Supports Windows, Linux, and macOS

## Prerequisites

### Windows
- Windows operating system
- PowerShell 5.1 or higher
- Internet connection
- Administrator privileges (for script execution)

### Linux
- Bash shell
- Internet connection
- `curl` and `grep` commands installed
- Write permissions to ~/Documents

### macOS
- macOS operating system
- Zsh shell (default since Catalina)
- Internet connection
- `curl` command installed
- Write permissions to ~/Documents

## Installation

### Windows
1. Clone this repository:
   ```powershell
   git clone https://github.com/Contrum/install-maven.git
   ```

2. Navigate to the script directory:
   ```powershell
   cd install-maven
   ```

3. If needed, unblock the script:
   ```powershell
   Unblock-File -Path .\install-maven.ps1
   ```

4. Run the script:
   ```powershell
   .\install-maven.ps1
   ```

### Linux
1. Clone the repository and navigate to it:
   ```bash
   git clone https://github.com/Contrum/install-maven.git
   cd install-maven
   ```

2. Make the script executable and run it:
   ```bash
   chmod +x install-maven-linux.sh
   ./install-maven-linux.sh
   ```

3. Apply the changes:
   ```bash
   source ~/.bashrc
   ```

### macOS
1. Clone the repository and navigate to it:
   ```bash
   git clone https://github.com/Contrum/install-maven.git
   cd install-maven
   ```

2. Make the script executable and run it:
   ```bash
   chmod +x install-maven-mac.sh
   ./install-maven-mac.sh
   ```

3. Apply the changes:
   ```bash
   source ~/.zshrc
   ```

## What the Scripts Do

1. Create a Maven directory in your Documents folder
2. Download the latest Maven version from the official Apache website
3. Extract the Maven files
4. Set up the following environment variables:
   - MAVEN_HOME
   - M2_HOME
   - Add Maven's bin directory to PATH
5. Verify the installation by running `mvn -version`

## After Installation

After the script completes:
1. Restart your terminal/PowerShell/Command Prompt
2. Verify the installation by running:
   ```bash
   mvn -version
   ```

## Troubleshooting

### Windows Issues
1. **Execution Policy Error**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```

2. **Access Denied**
   - Make sure you're running PowerShell as Administrator

### Linux/macOS Issues
1. **Permission Denied**
   ```bash
   chmod +x install-maven-*.sh
   ```

2. **Command Not Found**
   - Linux: Run `source ~/.bashrc`
   - macOS: Run `source ~/.zshrc`

### Common Issues
1. **Download Issues**
   - Check your internet connection
   - Verify that https://dlcdn.apache.org is accessible

2. **PATH Issues**
   - Restart your terminal after installation
   - Verify environment variables are set correctly

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
   - Update documentation if needed
   - Test on your target platform
   - Ensure the GitHub Action workflows pass

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

1. Ensure you have the required shell and tools for your platform
2. For Windows: Set execution policy for development:
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