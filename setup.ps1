# One-click setup script for QQTLuaLS
# Usage: Invoke-WebRequest -Uri "https://raw.githubusercontent.com/yourusername/QQTLuaLS/main/setup.ps1" -OutFile "setup.ps1"; .\setup.ps1

param(
    [switch]$Global = $true
)

$REPO_URL = "https://github.com/yourusername/QQTLuaLS.git"
$INSTALL_DIR = "$env:USERPROFILE\.vscode\extensions\qqtluals"

Write-Host "QQTLuaLS One-Click Setup" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan

# Clone or update repository
if (Test-Path $INSTALL_DIR) {
    Write-Host "Updating existing installation..."
    Set-Location $INSTALL_DIR
    git pull
} else {
    Write-Host "Cloning QQTLuaLS repository..."
    git clone $REPO_URL $INSTALL_DIR
    Set-Location $INSTALL_DIR
}

# Initialize submodules
Write-Host "Initializing submodules..."
git submodule update --init --recursive

# Run installation
Write-Host "Installing to VS Code..."
if ($Global) {
    .\scripts\install_for_vscode.ps1 -Global
} else {
    .\scripts\install_for_vscode.ps1
}

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host "Restart VS Code to start using QQTLuaLS." -ForegroundColor Green
Write-Host ""
Write-Host "Test it by creating a Lua file and typing: get_local_player()" -ForegroundColor Yellow