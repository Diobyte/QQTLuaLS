# QQTLuaLS - Lua Language Server Plugin for QQT Diablo API

This is a Lua Language Server (LuaLS) plugin that provides type annotations and IntelliSense support for the QQT Diablo API, used in Lua scripts for Diablo Immortal game automation.

**Version 1.9.1** - Enhanced with improved examples, type safety, operator support, and automation tools.

## Features

- Complete type definitions for the QQT Diablo Lua API
- IntelliSense support for game objects, vectors, colors, and more
- Annotations for Lua 5.1 with LuaJIT extensions
- Comprehensive documentation links

## Installation

### One-Click Setup (Easiest)

**Windows (PowerShell)**:

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/yourusername/QQTLuaLS/main/setup.ps1" -OutFile "setup.ps1"; .\setup.ps1
```

**Linux/Mac (Bash)**:

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/QQTLuaLS/main/setup.sh | bash
```

### Manual Setup

#### Quick Start (Recommended)

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/QQTLuaLS.git
   cd QQTLuaLS
   ```

2. **Run the installation script**:

   **Windows (PowerShell - Recommended)**:

   ```powershell
   .\scripts\install_for_vscode.ps1
   ```

   **Windows (Batch)**:

   ```cmd
   .\scripts\install.bat
   ```

   **Linux/Mac (Bash)**:

   ```bash
   ./scripts/install.sh
   ```

   For global installation (all projects), add `--global` flag:

   ```powershell
   .\scripts\install_for_vscode.ps1 -Global
   ```

   ```bash
   ./scripts/install.sh --global
   ```

### Manual Installation

#### Option 1: Workspace Installation (Per Project)

Add to your project's `.vscode/settings.json`:

```json
{
  "Lua.workspace.library": ["path/to/QQTLuaLS/library"]
}
```

#### Option 2: Global Installation (All Projects)

Add to your user settings (`Ctrl+Shift+P` → "Preferences: Open User Settings (JSON)"):

```json
{
  "Lua.workspace.library": ["path/to/QQTLuaLS/library"]
}
```

### Cross-Platform Installation

For non-Windows systems, manually add the library path as shown above. The library path should point to the `library/` folder in the cloned repository.

### Verification

After installation:

1. Open a Lua file in VS Code
2. Try typing `get_local_player()` - you should see IntelliSense
3. Hover over functions to see type information

### Requirements

- VS Code with [Lua Language Server extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) installed
- Git for cloning the repository

### Lua Runtime Installation (Optional)

For console-based testing and running Lua scripts outside of the game environment, you can install Lua 5.1:

**Windows (PowerShell)**:

```powershell
.\scripts\install_lua.ps1
```

**Linux/Mac (Bash)**:

```bash
./scripts/install_lua.sh
```

This will download and install Lua 5.1 to a local directory and update your PATH. You can also use the setup scripts with the Lua installation flag:

**Windows**:

```powershell
.\setup.ps1 -InstallLua
```

**Linux/Mac**:

```bash
./setup.sh --install-lua
```

### Example Configuration

See `.vscode/settings.json` in this repository for an example configuration that includes:

- Library path setup
- Lua 5.1 runtime version
- Common global functions for diagnostics

## Updating the Library

To sync with the latest changes from the QQT Diablo wiki and keep the annotations up-to-date:

1. Update the temp_wiki submodule to fetch the latest wiki content:

   ```bash
   git submodule update --remote temp_wiki
   ```

2. Review the updated markdown files in `temp_wiki/` for any new API changes or additions.

3. Manually update the corresponding Lua annotation files in `library/` to reflect the wiki changes:

   - Add new functions, classes, or parameters
   - Update type annotations from `any` to concrete types where possible
   - Enhance descriptions and add code examples
   - Verify cross-references to wiki pages

4. Test the updated annotations in your LuaLS environment to ensure no syntax errors and proper IntelliSense.

5. Commit the changes and create a pull request if contributing back.

This process ensures the type annotations remain accurate and comprehensive as the QQT Diablo API evolves.

## API Coverage

The plugin includes annotations for:

- Global functions (`global.lua`)
- Game objects (`game_object.lua`)
- Vectors (`vec2.lua`, `vec3.lua`)
- Colors (`color.lua`)
- Actors manager (`actors_manager.lua`)
- Auto play (`auto_play.lua`)
- Graphics (`graphics.lua`)
- And many more modules

## Source

Based on the QQT Diablo wiki: https://github.com/qqtnn/qqt_diablo.wiki.git

## Troubleshooting

### IntelliSense Not Working

- Ensure the library path is correctly added to your VS Code settings. Check `.vscode/settings.json` contains:
  ```json
  {
    "Lua.workspace.library": ["path/to/QQTLuaLS/library"]
  }
  ```
- Restart VS Code after installation.
- Verify Lua LS is enabled and configured for Lua 5.1.

### Parse Errors in Annotations

- Run the test script: `lua test_annotations.lua` to check for syntax issues.
- Ensure your Lua LS version supports EmmyLua annotations.

### Wiki Sync Issues

- If submodule updates fail, try: `git submodule sync && git submodule update --init --recursive`

## Performance Tips

- Use `squared_dist_to_ignore_z()` instead of `dist_to_ignore_z()` for distance checks in loops to avoid square root calculations.
- Cache frequently accessed objects like `get_local_player()` in variables.
- Prefer table lookups over repeated function calls in hot paths.

## License

MIT
