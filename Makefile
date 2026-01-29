.PHONY: help vm-up vm-down vm-ssh vm-status vm-rebuild vm-clean ssh-config

help: ## Show this help message
	@echo "Available commands:"
	@echo "  make vm-up          - Start the Windows VM (first time: downloads and provisions)"
	@echo "  make vm-down        - Stop the VM"
	@echo "  make vm-ssh         - SSH into the VM"
	@echo "  make vm-status      - Check VM status"
	@echo "  make vm-rebuild     - Rebuild and reprovision the VM"
	@echo "  make vm-clean       - Destroy the VM completely"
	@echo "  make ssh-config     - Show SSH config for VS Code Remote"

vm-up: ## Start the Windows VM
	@echo "Starting Windows VM..."
	@echo "First time will take 10-20 minutes (downloading Windows and installing tools)"
	vagrant up

vm-down: ## Stop the VM
	@echo "Stopping Windows VM..."
	vagrant halt

vm-ssh: ## SSH into the VM
	@echo "Connecting to Windows VM via SSH..."
	vagrant ssh

vm-status: ## Check VM status
	@vagrant status

vm-rebuild: ## Rebuild and reprovision the VM
	@echo "Rebuilding VM..."
	vagrant reload --provision

vm-clean: ## Destroy the VM completely
	@echo "WARNING: This will destroy the VM and all data not in shared folders!"
	@echo "Press Ctrl+C to cancel, or wait 5 seconds to continue..."
	@sleep 5
	vagrant destroy -f

ssh-config: ## Show SSH config for VS Code Remote
	@echo ""
	@echo "Add this to your ~/.ssh/config file:"
	@echo "========================================"
	@vagrant ssh-config
	@echo "========================================"
	@echo ""
	@echo "Then in VS Code:"
	@echo "1. Install 'Remote - SSH' extension"
	@echo "2. Press F1 and select 'Remote-SSH: Connect to Host...'"
	@echo "3. Select 'default' from the list"
	@echo "4. Your project files are at: C:\\workspace"
	@echo ""
