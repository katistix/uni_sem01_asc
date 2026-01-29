# Provision Windows VM with x86 Assembly Development Tools

Write-Host "Starting provisioning of Windows development environment..."

# Set execution policy
Set-ExecutionPolicy Bypass -Scope Process -Force

# Install Chocolatey package manager
Write-Host "Installing Chocolatey..."
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Refresh environment
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install Git
Write-Host "Installing Git..."
choco install -y git

# Install NASM
Write-Host "Installing NASM..."
choco install -y nasm

# Install Visual Studio Build Tools 2022 with C++ workload
Write-Host "Installing Visual Studio Build Tools 2022 (this may take a while)..."
choco install -y visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --includeRecommended --passive --locale en-US"

# Install text editors (optional)
Write-Host "Installing text editors..."
choco install -y nano
choco install -y vim

# Download and install alink (PE linker)
Write-Host "Setting up alink..."
$alinkDir = "C:\tools\alink"
New-Item -ItemType Directory -Force -Path $alinkDir | Out-Null

try {
    Invoke-WebRequest -Uri 'http://www.japheth.de/Download/alink/alink.zip' -OutFile "$alinkDir\alink.zip" -ErrorAction Stop
    Expand-Archive -Path "$alinkDir\alink.zip" -DestinationPath $alinkDir -Force
    Remove-Item "$alinkDir\alink.zip"
    Write-Host "alink installed successfully"
} catch {
    Write-Host "Could not download alink automatically. You may need to download it manually from http://www.japheth.de/"
}

# Add tools to PATH
Write-Host "Configuring PATH..."
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
$newPaths = @(
    "C:\Program Files\NASM",
    "C:\tools\alink"
)

foreach ($newPath in $newPaths) {
    if ($currentPath -notlike "*$newPath*") {
        $currentPath = "$currentPath;$newPath"
    }
}

[Environment]::SetEnvironmentVariable("Path", $currentPath, "Machine")

# Create a helper script to set up Visual Studio environment
Write-Host "Creating VS environment helper script..."
$vsHelperScript = @"
@echo off
REM Helper script to set up Visual Studio Build Tools environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
echo Visual Studio x86 environment configured.
echo You can now use cl.exe, link.exe, and other MSVC tools.
"@

Set-Content -Path "C:\workspace\setup_vs_env.bat" -Value $vsHelperScript

Write-Host ""
Write-Host "=========================================="
Write-Host "Provisioning complete!"
Write-Host "=========================================="
Write-Host ""
Write-Host "Installed tools:"
Write-Host "  - NASM assembler"
Write-Host "  - Visual Studio Build Tools 2022"
Write-Host "  - alink PE linker"
Write-Host "  - Git"
Write-Host ""
Write-Host "Your project files are available at: C:\workspace"
Write-Host ""
Write-Host "To use MSVC tools, run: C:\workspace\setup_vs_env.bat"
Write-Host ""
