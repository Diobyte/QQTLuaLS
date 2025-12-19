@echo off
REM Simple batch installer for QQTLuaLS
REM This creates a basic .vscode\settings.json if it doesn't exist

if not exist ".vscode" mkdir .vscode

if not exist ".vscode\settings.json" (
    echo Creating .vscode\settings.json
    echo { > .vscode\settings.json
    echo   "Lua.workspace.library": ["./library"], >> .vscode\settings.json
    echo   "Lua.runtime.version": "Lua 5.1" >> .vscode\settings.json
    echo } >> .vscode\settings.json
) else (
    echo .vscode\settings.json already exists. Please manually add:
    echo "Lua.workspace.library": ["./library"]
)

echo Installation complete! Restart VS Code.
pause