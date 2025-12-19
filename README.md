# QQT Diablo LuaLS Library (qqt_diablo)

This project converts the `qqt_diablo.wiki` documentation into Lua annotation stubs for use with Lua Language Server (LuaLS / sumneko lua).

What you get:

- A `library/` directory containing annotated Lua files (`---@meta`, `---@class`, `---@param`, `---@return`) generated from the wiki.
- A `scripts/generate_library.py` generator so you can re-run generation after the wiki updates.
- A `scripts/install_for_vscode.ps1` helper to add the generated library to your workspace settings.

Quick install (VSCode + sumneko/lua-language-server):

1. Open your VSCode workspace `Settings` (Workspace settings), and add the path to this repo's `library` folder under `Lua.workspace.library`.

Add to `.vscode/settings.json` (example):

```
{
  "Lua.workspace.library": [
    "${workspaceFolder}/path/to/QQTLuaLS/library"
  ]
}
```

Or run the PowerShell helper in this repo to add it automatically for the current workspace (`scripts/install_for_vscode.ps1`).

Notes:

- The generator is conservative and produces `any` return/param types where the wiki does not specify concrete types. You can manually improve types in `library/*.lua` files.
- To re-generate after pulling wiki updates, run `python scripts/generate_library.py`.

Validation

- Run `python scripts/validate_library.py` to scan the `library/` files for common issues (bad `---@param` syntax, `bool` vs `boolean`, numeric parenthesis like `(int)` or `(float)`, constructor conflicts, etc.).
- Fix any flagged files and re-run the validator.

License: add one if needed.
