#!/bin/bash
# Cross-platform Lua installer for QQTLuaLS

set -e

LUA_VERSION="5.1.5"
INSTALL_DIR="$HOME/.local/lua"

echo "QQTLuaLS Lua Installer"
echo "======================"

# Check if Lua is already installed
if command -v lua &> /dev/null && [[ ! "$1" == "--force" ]]; then
    LUA_VER=$(lua -v 2>&1 | grep -oP 'Lua \K\d+\.\d+')
    echo "Lua is already installed (version $LUA_VER). Use --force to reinstall."
    exit 0
fi

# Create install directory
mkdir -p "$INSTALL_DIR"

echo "Installing Lua $LUA_VERSION..."

# Detect OS and install accordingly
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
        echo "Using apt-get..."
        sudo apt-get update
        sudo apt-get install -y lua5.1 lua5.1-dev
    elif command -v yum &> /dev/null; then
        echo "Using yum..."
        sudo yum install -y lua lua-devel
    elif command -v pacman &> /dev/null; then
        echo "Using pacman..."
        sudo pacman -S lua --noconfirm
    else
        echo "No supported package manager found. Installing from source..."
        install_from_source
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
        echo "Using Homebrew..."
        brew install lua@5.1
        # Add to PATH
        echo 'export PATH="/usr/local/opt/lua@5.1/bin:$PATH"' >> ~/.zshrc
        echo 'export PATH="/usr/local/opt/lua@5.1/bin:$PATH"' >> ~/.bash_profile
    else
        echo "Homebrew not found. Installing from source..."
        install_from_source
    fi

else
    echo "Unsupported OS: $OSTYPE"
    echo "Please install Lua manually from https://www.lua.org/download.html"
    exit 1
fi

# Test installation
if command -v lua &> /dev/null; then
    LUA_VER=$(lua -v 2>&1 | grep -oP 'Lua \K\d+\.\d+' || lua -v 2>&1 | grep -o 'Lua [0-9]\+\.[0-9]\+' | cut -d' ' -f2)
    echo "Lua $LUA_VER installed successfully!"
else
    echo "Lua installation failed. Please install manually."
    exit 1
fi

echo ""
echo "To use Lua in VS Code terminals, restart VS Code or run:"
echo "export PATH=\"$(which lua | xargs dirname):\$PATH\""

install_from_source() {
    echo "Installing Lua from source..."
    cd /tmp
    wget https://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz
    tar -xzf lua-$LUA_VERSION.tar.gz
    cd lua-$LUA_VERSION
    make linux
    make install INSTALL_TOP="$INSTALL_DIR"

    # Add to PATH
    echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> ~/.bashrc
    echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> ~/.zshrc 2>/dev/null || true

    export PATH="$INSTALL_DIR/bin:$PATH"
}