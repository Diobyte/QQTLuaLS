#!/bin/bash
# One-click setup script for QQTLuaLS
# Usage: curl -fsSL https://raw.githubusercontent.com/yourusername/QQTLuaLS/main/setup.sh | bash

set -e

REPO_URL="https://github.com/yourusername/QQTLuaLS.git"
INSTALL_DIR="$HOME/.vscode/extensions/qqtluals"

echo "QQTLuaLS One-Click Setup"
echo "========================="

# Install Lua if requested
if [[ "$1" == "--install-lua" ]]; then
    echo "Installing Lua..."
    ./scripts/install_lua.sh
    echo ""
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is required but not installed."
    exit 1
fi

# Clone repository
echo "Cloning QQTLuaLS repository..."
if [[ -d "$INSTALL_DIR" ]]; then
    echo "Updating existing installation..."
    cd "$INSTALL_DIR"
    git pull
else
    git clone "$REPO_URL" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Initialize submodules
echo "Initializing submodules..."
git submodule update --init --recursive

# Run installation
echo "Installing to VS Code..."
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    powershell.exe -ExecutionPolicy Bypass -File "scripts/install_for_vscode.ps1" -Global
else
    # Unix-like
    ./scripts/install.sh --global
fi

echo ""
echo "✅ Installation complete!"
echo "Restart VS Code to start using QQTLuaLS."
echo ""
echo "Test it by creating a Lua file and typing: get_local_player()"