#!/bin/bash
# One-click setup script for QQTLuaLS
# Usage: curl -fsSL https://raw.githubusercontent.com/yourusername/QQTLuaLS/main/setup.sh | bash

set -e

REPO_URL="https://github.com/Diobit27/QQTLuaLS.git"
INSTALL_DIR="$HOME/.vscode/extensions/qqtluals"

echo "QQTLuaLS One-Click Setup"
echo "========================="

# Track install flags
INSTALL_LUA=false
if [[ "$1" == "--install-lua" ]]; then
    INSTALL_LUA=true
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
    # Windows: defer to PowerShell scripts with ExecutionPolicy Bypass
    if [[ "$INSTALL_LUA" == "true" ]]; then
        powershell.exe -NoProfile -ExecutionPolicy Bypass -File "scripts/install_lua.ps1"
    fi
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "scripts/install_for_vscode.ps1" -Global
else
    # Unix-like
    if [[ "$INSTALL_LUA" == "true" ]]; then
        ./scripts/install_lua.sh
        echo "Lua installed and added to PATH."
        echo ""
    fi
    ./scripts/install.sh --global
fi

echo ""
echo "✅ Installation complete!"
echo "Restart VS Code to start using QQTLuaLS."
echo ""
echo "Test it by creating a Lua file and typing: get_local_player()"