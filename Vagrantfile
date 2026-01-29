# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Use Windows 10 or Windows Server box
  # Note: You'll need a Windows box. Common options:
  # - gusztavvargadr/windows-10 (free evaluation)
  # - gusztavvargadr/windows-server (free evaluation)
  config.vm.box = "gusztavvargadr/windows-10"
  
  # VM configuration
  config.vm.hostname = "asm-dev-windows"
  
  # Network configuration
  config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true
  config.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", auto_correct: true
  
  # Sync your project folder to the VM
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.synced_folder ".", "C:/workspace"
  
  # VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ASM-Dev-Windows"
    vb.gui = false  # Headless mode
    vb.memory = "4096"  # 4GB RAM
    vb.cpus = 2
    
    # Enable nested virtualization if needed
    vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
  end
  
  # Enable WinRM for provisioning
  config.vm.communicator = "winrm"
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  
  # Provision the VM with development tools
  config.vm.provision "shell", path: "provision.ps1"
  
  # Configure SSH for VS Code Remote
  config.vm.provision "shell", inline: <<-SHELL
    # Enable OpenSSH Server
    Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
    Start-Service sshd
    Set-Service -Name sshd -StartupType 'Automatic'
    
    # Configure firewall
    if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue)) {
        New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
    }
    
    Write-Host "SSH Server configured successfully"
  SHELL
end
