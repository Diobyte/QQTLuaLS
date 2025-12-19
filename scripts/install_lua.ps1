# Lua Installer for QQTLuaLS
# Downloads and installs Lua 5.1 for Windows

param(
    [string]$InstallPath = "$env:USERPROFILE\lua",
    [switch]$Force
)

$LuaVersion = "5.1.5"
$LuaUrl = "https://downloads.sourceforge.net/project/luabinaries/5.1.5/Windows%20Libraries/Dynamic/lua-5.1.5_Win64_dllw6_lib.zip"
$ZipPath = "$env:TEMP\lua-$LuaVersion.zip"

Write-Host "QQTLuaLS Lua Installer" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan

# Check if Lua is already installed
if ((Get-Command lua -ErrorAction SilentlyContinue) -and -not $Force) {
    $luaVersion = & lua -v 2>&1 | Select-String -Pattern "Lua (\d+\.\d+)" | ForEach-Object { $_.Matches.Groups[1].Value }
    Write-Host "Lua is already installed (version $luaVersion). Use -Force to reinstall." -ForegroundColor Yellow
    exit 0
}

# Try to install using winget first (modern Windows)
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "Installing Lua using winget..." -ForegroundColor Yellow
    try {
        winget install --id=rjpcomputing.luaforwindows --accept-source-agreements --accept-package-agreements
        Write-Host "Lua installed successfully via winget!" -ForegroundColor Green
        
        # Find the Lua installation directory
        $luaPath = "C:\Program Files (x86)\Lua\5.1"
        if (-not (Test-Path "$luaPath\lua.exe")) {
            # Try alternative locations
            $luaPath = Get-ChildItem "C:\Program Files*\Lua" -Directory | Where-Object { Test-Path "$($_.FullName)\lua.exe" } | Select-Object -First 1 -ExpandProperty FullName
        }
        
        if ($luaPath) {
            # Add to PATH for current session
            $env:PATH = "$luaPath;$env:PATH"
            
            # Add to user PATH permanently
            $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
            if ($userPath -notlike "*$luaPath*") {
                [Environment]::SetEnvironmentVariable("PATH", "$userPath;$luaPath", "User")
                Write-Host "Added Lua to your PATH. Restart your terminal for the changes to take effect." -ForegroundColor Yellow
            }
        }
        
        # Test installation
        $testResult = & lua -v 2>&1
        if ($testResult -match "Lua") {
            Write-Host "Lua is working correctly." -ForegroundColor Green
        }
        exit 0
    } catch {
        Write-Host "Winget installation failed, trying manual download..." -ForegroundColor Yellow
    }
}

# Fallback: manual download
Write-Host "Downloading Lua $LuaVersion manually..." -ForegroundColor Yellow

try {
    # Download Lua binaries
    Invoke-WebRequest -Uri $LuaUrl -OutFile $ZipPath -UseBasicParsing

    Write-Host "Extracting Lua..." -ForegroundColor Yellow

    # Extract the zip
    Expand-Archive -Path $ZipPath -DestinationPath $InstallPath -Force

    # Clean up
    Remove-Item $ZipPath -ErrorAction SilentlyContinue

    # Find the extracted directory
    $extractedDir = Get-ChildItem $InstallPath | Where-Object { $_.PSIsContainer } | Select-Object -First 1
    if ($extractedDir) {
        $luaDir = Join-Path $InstallPath $extractedDir.Name
        # Move contents up one level
        Get-ChildItem $luaDir | Move-Item -Destination $InstallPath
        Remove-Item $luaDir -Recurse -Force
    }

    Write-Host "Lua installed successfully!" -ForegroundColor Green

    # Add to PATH for current session
    $env:PATH = "$InstallPath;$env:PATH"
    
    # Add to user PATH permanently
    $userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if ($userPath -notlike "*$InstallPath*") {
        [Environment]::SetEnvironmentVariable("PATH", "$userPath;$InstallPath", "User")
        Write-Host "Added Lua to your PATH. Restart your terminal for the changes to take effect." -ForegroundColor Yellow
    }

    # Test installation
    $testResult = & lua -v 2>&1
    if ($testResult -match "Lua $LuaVersion") {
        Write-Host "Lua $LuaVersion is working correctly." -ForegroundColor Green
    } else {
        Write-Host "Warning: Lua installation may not be working correctly." -ForegroundColor Yellow
    }

} catch {
    Write-Host "Error installing Lua: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}