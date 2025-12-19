#!/bin/bash
# Cross-platform Lua installer for QQTLuaLS

set -e

LUA_VERSION="5.1.5"
INSTALL_DIR="$HOME/.local/lua"

install_from_source() {
    echo "Installing Lua from source (v$LUA_VERSION)..."
    tmp_dir="$(mktemp -d)"
    cd "$tmp_dir"
    curl -fsSL "https://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz" -o lua-${LUA_VERSION}.tar.gz
    tar -xzf lua-${LUA_VERSION}.tar.gz
    cd lua-${LUA_VERSION}
    make linux
    make install INSTALL_TOP="$INSTALL_DIR"

    echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> "$HOME/.bashrc"
    echo "export PATH=\"$INSTALL_DIR/bin:\$PATH\"" >> "$HOME/.zshrc" 2>/dev/null || true
    export PATH="$INSTALL_DIR/bin:$PATH"
    cd - >/dev/null
    rm -rf "$tmp_dir"
}

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
        echo "Using apt-get (lua5.1/lua5.1-dev)..."
        sudo apt-get update
        sudo apt-get install -y lua5.1 lua5.1-dev
    elif command -v yum &> /dev/null; then
        echo "Using yum (lua-5.1)..."
        sudo yum install -y lua lua-devel
    elif command -v pacman &> /dev/null; then
        echo "Using pacman (lua51)..."
        sudo pacman -S lua51 --noconfirm
    else
        echo "No supported package manager found. Installing from source..."
        install_from_source
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
        echo "Using Homebrew (lua@5.1)..."
        brew install lua@5.1
        # Add both Intel and Apple Silicon prefixes
        echo 'export PATH="/usr/local/opt/lua@5.1/bin:$PATH"' >> ~/.bash_profile
        echo 'export PATH="/usr/local/opt/lua@5.1/bin:$PATH"' >> ~/.zshrc
        echo 'export PATH="/opt/homebrew/opt/lua@5.1/bin:$PATH"' >> ~/.bash_profile
        echo 'export PATH="/opt/homebrew/opt/lua@5.1/bin:$PATH"' >> ~/.zshrc
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
    
    # Ensure PATH is updated for current session
    LUA_BIN_DIR=$(dirname "$(which lua)")
    if [[ ":$PATH:" != *":$LUA_BIN_DIR:"* ]]; then
        export PATH="$LUA_BIN_DIR:$PATH"
        echo "Added $LUA_BIN_DIR to PATH for current session."
    fi
    
    echo ""
    echo "Lua is now available in your PATH."
    echo "Restart your terminal or run 'source ~/.bashrc' to use it in new sessions."
else
    echo "Lua installation failed. Please install manually."
    exit 1
fi
