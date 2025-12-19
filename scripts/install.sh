#!/bin/bash
# Cross-platform installation script for QQTLuaLS
# Usage: ./scripts/install.sh [--global]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_PATH="$(cd "$SCRIPT_DIR/../library" && pwd)"

echo "QQTLuaLS Installation Script"
echo "Library path: $LIB_PATH"

if [[ "$1" == "--global" ]]; then
    echo "Installing globally (user settings)..."

    # Detect OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        SETTINGS_FILE="$HOME/.config/Code/User/settings.json"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"
    else
        echo "Unsupported OS for global installation. Please install manually."
        exit 1
    fi
else
    echo "Installing to workspace..."

    # Check if we're in a git repository
    if [[ -d ".git" ]] || [[ -f ".vscode/settings.json" ]]; then
        SETTINGS_FILE=".vscode/settings.json"
    else
        echo "Not in a VS Code workspace. Use --global for user settings."
        exit 1
    fi
fi

echo "Settings file: $SETTINGS_FILE"

# Create directory if needed
mkdir -p "$(dirname "$SETTINGS_FILE")"

# Read or create settings
if [[ -f "$SETTINGS_FILE" ]]; then
    # Use python or node to parse JSON if available
    if command -v python3 &> /dev/null; then
        python3 -c "
import json
import sys
with open('$SETTINGS_FILE', 'r') as f:
    try:
        data = json.load(f)
    except:
        data = {}
if 'Lua.workspace.library' not in data:
    data['Lua.workspace.library'] = []
if '$LIB_PATH' not in data['Lua.workspace.library']:
    data['Lua.workspace.library'].append('$LIB_PATH')
    print('Added library path')
else:
    print('Library path already exists')
with open('$SETTINGS_FILE', 'w') as f:
    json.dump(data, f, indent=2)
"
    elif command -v node &> /dev/null; then
        node -e "
const fs = require('fs');
let data = {};
try {
    data = JSON.parse(fs.readFileSync('$SETTINGS_FILE', 'utf8'));
} catch (e) {}
if (!data['Lua.workspace.library']) data['Lua.workspace.library'] = [];
if (!data['Lua.workspace.library'].includes('$LIB_PATH')) {
    data['Lua.workspace.library'].push('$LIB_PATH');
    console.log('Added library path');
} else {
    console.log('Library path already exists');
}
fs.writeFileSync('$SETTINGS_FILE', JSON.stringify(data, null, 2));
"
    else
        echo "Python3 or Node.js required for automatic JSON editing."
        echo "Please manually add to $SETTINGS_FILE:"
        echo "{"
        echo "  \"Lua.workspace.library\": [\"$LIB_PATH\"]"
        echo "}"
        exit 1
    fi
else
    echo "{}" > "$SETTINGS_FILE"
    if command -v python3 &> /dev/null; then
        python3 -c "
import json
data = {'Lua.workspace.library': ['$LIB_PATH']}
with open('$SETTINGS_FILE', 'w') as f:
    json.dump(data, f, indent=2)
"
    else
        echo "Please manually add to $SETTINGS_FILE:"
        echo "{"
        echo "  \"Lua.workspace.library\": [\"$LIB_PATH\"]"
        echo "}"
    fi
fi

echo "Installation complete! Restart VS Code to apply changes."