# Define installation path
$documentsPath = [Environment]::GetFolderPath("MyDocuments")
$mavenPath = Join-Path -Path $documentsPath -ChildPath "maven"

# Create Maven directory if it doesn't exist
if (-not (Test-Path -Path $mavenPath)) {
    New-Item -ItemType Directory -Path $mavenPath | Out-Null
    Write-Host "Maven directory created: $mavenPath"
}

# Get the latest Maven version from Apache website
$mavenUrl = "https://dlcdn.apache.org/maven/maven-3/"
try {
    $webRequest = Invoke-WebRequest -Uri $mavenUrl
    $latestVersion = ($webRequest.Links | Where-Object { $_.href -match '3\.\d+\.\d+\/' } |
                     Select-Object -Last 1).href.TrimEnd('/')

    # Construct download URL
    $downloadUrl = "${mavenUrl}${latestVersion}/binaries/apache-maven-${latestVersion}-bin.zip"
    $zipFile = Join-Path -Path $mavenPath -ChildPath "maven.zip"

    # Download Maven
    Write-Host "Downloading Maven $latestVersion..."
    Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile

    # Extract ZIP file
    Write-Host "Extracting Maven..."
    Expand-Archive -Path $zipFile -DestinationPath $mavenPath -Force

    # Remove ZIP file
    Remove-Item -Path $zipFile

    # Move content from subdirectory
    $extractedDir = Get-ChildItem -Path $mavenPath -Directory | Where-Object { $_.Name -match "apache-maven" } | Select-Object -First 1
    $mavenBinPath = Join-Path -Path $extractedDir.FullName -ChildPath "bin"

    # Set environment variables
    Write-Host "Setting environment variables..."

    # MAVEN_HOME
    [System.Environment]::SetEnvironmentVariable(
        "MAVEN_HOME",
        $extractedDir.FullName,
        [System.EnvironmentVariableTarget]::User
    )

    # M2_HOME
    [System.Environment]::SetEnvironmentVariable(
        "M2_HOME",
        $extractedDir.FullName,
        [System.EnvironmentVariableTarget]::User
    )

    # Add Maven to PATH
    $currentPath = [System.Environment]::GetEnvironmentVariable(
        "Path",
        [System.EnvironmentVariableTarget]::User
    )

    if (-not $currentPath.Contains($mavenBinPath)) {
        $newPath = "$currentPath;$mavenBinPath"
        [System.Environment]::SetEnvironmentVariable(
            "Path",
            $newPath,
            [System.EnvironmentVariableTarget]::User
        )
    }

    Write-Host "Maven $latestVersion has been successfully installed!"
    Write-Host "Installation Path: $($extractedDir.FullName)"
    Write-Host "Please restart your PowerShell/Command Prompt for the changes to take effect."

    # Test the installation
    $testResult = & "$mavenBinPath\mvn.cmd" -version
    if ($?) {
        Write-Host "`nMaven installation successfully verified:"
        Write-Host $testResult
    }

} catch {
    Write-Host "Installation error: $_"
    exit 1
}