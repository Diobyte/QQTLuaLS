<#
Add this library to the current workspace .vscode/settings.json under Lua.workspace.library
Usage: .\scripts\install_for_vscode.ps1 -WorkspaceFolder .
#>
param(
    [string]$WorkspaceFolder = "${PWD}"
)

$settingsPath = Join-Path $WorkspaceFolder ".vscode\settings.json"
if (-not (Test-Path $settingsPath)) {
    New-Item -ItemType Directory -Path (Split-Path $settingsPath) -Force | Out-Null
    '{}' | Out-File -FilePath $settingsPath -Encoding utf8
}

$json = Get-Content $settingsPath -Raw | ConvertFrom-Json -ErrorAction SilentlyContinue
if (-not $json) { $json = @{} }
$libPath = (Resolve-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\..\library").Path
if (-not $json.'Lua.workspace.library') { $json | Add-Member -NotePropertyName 'Lua.workspace.library' -NotePropertyValue @() }
if ($json.'Lua.workspace.library' -notcontains $libPath) {
    $json.'Lua.workspace.library' += $libPath
}

$json | ConvertTo-Json -Depth 6 | Out-File -FilePath $settingsPath -Encoding utf8
Write-Host "Added library path to $settingsPath: $libPath" -ForegroundColor Green
