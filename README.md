# QQT Diablo LuaLS Library (qqt_diablo)

This project converts the `qqt_diablo.wiki` documentation into Lua annotation stubs for use with Lua Language Server (LuaLS / sumneko lua).

What you get:

- A `library/` directory containing annotated Lua files (`---@meta`, `---@class`, `---@param`, `---@return`) generated from the wiki.
- A `scripts/generate_library.py` generator so you can re-run generation after the wiki updates.
- A `scripts/install_for_vscode.ps1` helper to add the generated library to your workspace settings.

Quick install (VSCode + Lua Language Server):

1) Configure LuaLS runtime and library for LuaJIT (recommended for in-game scripting):

Add the following to `.vscode/settings.json` (workspace):

```
{
  "Lua.runtime.version": "LuaJIT",
  "Lua.workspace.library": [
    "${workspaceFolder}/library"
  ],
  "Lua.diagnostics.globals": [
    "get_local_player", "get_player_position", "actors_manager", "vec3", "vec2", "game_object"
  ]
}
```

Or use the sample file included in the repo: `.vscode/settings.json.sample` (copy/merge into your workspace `.vscode/settings.json`).

2) Or run the PowerShell helper in this repo to add the library automatically for the current workspace (`scripts/install_for_vscode.ps1`).

Notes:

- The generator is conservative and produces `any` return/param types where the wiki does not specify concrete types. You can manually improve types in `library/*.lua` files.
- To re-generate after pulling wiki updates, run `python scripts/generate_library.py`.

Validation

- Run `python scripts/validate_library.py` to scan the `library/` files for common issues (bad `---@param` syntax, `bool` vs `boolean`, numeric parenthesis like `(int)` or `(float)`, constructor conflicts, etc.).
- Fix any flagged files and re-run the validator.

License: add one if needed.
