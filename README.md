# sem01 - asc - UBB FMI

repo for all things related to ASC (Arhitectura Sistemelor de Calcul)

## Development Environment

This project uses a **headless Windows VM** with native Windows build tools for x86 assembly development. You can develop on Mac/Linux and connect to the Windows VM via VS Code Remote-SSH.

### Prerequisites

- **VirtualBox** - Download from https://www.virtualbox.org/
- **Vagrant** - Download from https://www.vagrantup.com/
- **VS Code** with "Remote - SSH" extension
- **Make** (usually pre-installed on Mac/Linux)

### Quick Start

**1. Start the Windows VM (first time takes 15-30 minutes):**
```bash
make vm-up
```

This will:
- Download a Windows 10 evaluation image
- Install NASM, Visual Studio Build Tools, alink, and Git
- Configure SSH access
- Sync your project files to `C:\workspace`

**2. Configure VS Code Remote SSH:**
```bash
./setup-ssh.sh
```

**3. Connect from VS Code:**
- Open VS Code
- Press `F1` or `Cmd+Shift+P`
- Select "Remote-SSH: Connect to Host..."
- Choose "asm-dev-windows"
- Open folder: `C:\workspace`

Now you're coding on your Mac but running everything on Windows!

### Available Commands

```bash
make vm-up          # Start the VM
make vm-down        # Stop the VM
make vm-ssh         # SSH into VM (terminal)
make vm-status      # Check VM status
make vm-rebuild     # Rebuild/reprovision VM
make vm-clean       # Destroy VM completely
make ssh-config     # Show SSH configuration
```

### Building Projects

**Inside the VM (via VS Code Remote or SSH):**
```cmd
build.bat              # For pure ASM projects
build_asm_c.bat        # For ASM + C projects
```

### Development Workflow

1. Edit files in VS Code on your Mac (connected via Remote-SSH)
2. Files are automatically synced to the Windows VM
3. Run builds in the VS Code integrated terminal (running on Windows VM)
4. All tools are native Windows (NASM, MSVC cl.exe, alink)
5. Builds produce Windows PE executables for x86

### VM Details

- **OS**: Windows 10 Evaluation (180-day license)
- **Resources**: 4GB RAM, 2 CPU cores (configurable in Vagrantfile)
- **Project location in VM**: `C:\workspace`
- **Headless**: No GUI, access via SSH only

### Notes

- The VM runs in the background (headless mode)
- Your project files are automatically synced between Mac and VM
- All existing .bat files work without modification
- Use `make vm-down` when done to save resources
- The VM can be destroyed and rebuilt anytime with `make vm-clean && make vm-up`