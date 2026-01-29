# escape=`

FROM mcr.microsoft.com/windows/servercore:ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install NASM
RUN choco install -y nasm

# Install Visual Studio Build Tools 2022
RUN choco install -y visualstudio2022buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --includeOptional --passive --locale en-US"

# Install Git (optional, for version control)
RUN choco install -y git

# Download alink (PE linker)
RUN New-Item -ItemType Directory -Force -Path C:\tools\alink; `
    Invoke-WebRequest -Uri 'http://www.japheth.de/Download/alink/alink.zip' -OutFile C:\tools\alink\alink.zip -ErrorAction SilentlyContinue; `
    if (Test-Path C:\tools\alink\alink.zip) { `
        Expand-Archive -Path C:\tools\alink\alink.zip -DestinationPath C:\tools\alink -Force; `
        Remove-Item C:\tools\alink\alink.zip; `
    }

# Add tools to PATH
RUN $env:PATH = $env:PATH + ';C:\Program Files\NASM;C:\tools\alink'; `
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# Set up Visual Studio environment variables
RUN $vsPath = 'C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat'; `
    if (Test-Path $vsPath) { `
        Write-Host "Visual Studio Build Tools installed successfully"; `
    }

WORKDIR C:\workspace

# Set cmd as default shell for interactive use
CMD ["cmd.exe"]
