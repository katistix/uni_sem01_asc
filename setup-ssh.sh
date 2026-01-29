#!/bin/bash
# Helper script to configure SSH for VS Code Remote

echo "Configuring SSH for VS Code Remote Development..."
echo ""

# Get SSH config from Vagrant
SSH_CONFIG=$(vagrant ssh-config)

# Check if vagrant is running
if [ $? -ne 0 ]; then
    echo "ERROR: VM is not running. Please run 'make vm-up' first."
    exit 1
fi

# Path to SSH config file
SSH_CONFIG_FILE="$HOME/.ssh/config"

# Create .ssh directory if it doesn't exist
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Check if config already exists
if grep -q "Host asm-dev-windows" "$SSH_CONFIG_FILE" 2>/dev/null; then
    echo "SSH config for 'asm-dev-windows' already exists in $SSH_CONFIG_FILE"
    echo "To update it, remove the old entry first."
else
    # Add config
    echo "" >> "$SSH_CONFIG_FILE"
    echo "# ASM Development Windows VM" >> "$SSH_CONFIG_FILE"
    echo "Host asm-dev-windows" >> "$SSH_CONFIG_FILE"
    echo "$SSH_CONFIG" | grep -E "HostName|User|Port|IdentityFile|StrictHostKeyChecking|UserKnownHostsFile" >> "$SSH_CONFIG_FILE"
    
    echo "SSH config added successfully!"
fi

echo ""
echo "========================================"
echo "VS Code Remote Setup Complete!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Install 'Remote - SSH' extension in VS Code"
echo "2. Press F1 in VS Code"
echo "3. Select 'Remote-SSH: Connect to Host...'"
echo "4. Select 'asm-dev-windows'"
echo "5. Open folder: C:\\workspace"
echo ""
echo "Your project files will be synced automatically!"
echo ""
