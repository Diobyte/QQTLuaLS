<#
Add this library to VS Code settings under Lua.workspace.library
Usage:
  .\scripts\install_for_vscode.ps1                    # Workspace settings
  .\scripts\install_for_vscode.ps1 -Global           # User settings
  .\scripts\install_for_vscode.ps1 -WorkspaceFolder "C:\path\to\workspace"
#>
param(
    [string]$WorkspaceFolder = "${PWD}",
    [switch]$Global
)

$libPath = (Resolve-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\..\library").Path

if ($Global) {
    # Install to user settings
    $settingsPath = "$env:APPDATA\Code\User\settings.json"
    Write-Host "Installing to global VS Code user settings..." -ForegroundColor Yellow
} else {
    # Install to workspace settings
    $settingsPath = Join-Path $WorkspaceFolder ".vscode\settings.json"
    Write-Host "Installing to workspace VS Code settings..." -ForegroundColor Yellow
}

# Create directory if it doesn't exist (for workspace)
if (-not $Global) {
    $dir = Split-Path $settingsPath
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Read or create settings file
if (Test-Path $settingsPath) {
    $json = Get-Content $settingsPath -Raw | ConvertFrom-Json -ErrorAction SilentlyContinue
    if (-not $json) {
        Write-Host "Warning: Could not parse existing settings.json. Creating new one." -ForegroundColor Yellow
        $json = @{}
    }
} else {
    $json = @{}
    '{}' | Out-File -FilePath $settingsPath -Encoding utf8
}

# Add library path
if (-not $json.'Lua.workspace.library') {
    $json | Add-Member -NotePropertyName 'Lua.workspace.library' -NotePropertyValue @()
}

if ($json.'Lua.workspace.library' -notcontains $libPath) {
    $json.'Lua.workspace.library' += $libPath
    Write-Host "Added library path: $libPath" -ForegroundColor Green
} else {
    Write-Host "Library path already exists: $libPath" -ForegroundColor Yellow
}

# Save settings
$json | ConvertTo-Json -Depth 6 | Out-File -FilePath $settingsPath -Encoding utf8
Write-Host "Installation complete! Restart VS Code to apply changes." -ForegroundColor Green
Write-Host "Settings file: $settingsPath" -ForegroundColor Cyan
