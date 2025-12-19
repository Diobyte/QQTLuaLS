# Contributing

Workflow (developer)

1. Update or pull the `qqt_diablo.wiki` (either update the `temp_wiki/` folder or update submodule if you are tracking it as a submodule).
2. Run the generator to refresh `library/`:

   ```bash
   python scripts/generate_library.py
   ```

3. Run validator & verifier:

   ```bash
   python scripts/validate_library.py
   python scripts/verify_against_wiki.py
   ```

4. Fix any reported issues and commit.

5. Update README or add better types if you improve any `library/*.lua` files.

Local testing

- Use the included `scripts/install_for_vscode.ps1` to add `library` path to your workspace settings or copy `.vscode/settings.json.sample` into your workspace.

CI

- Add a GitHub Actions workflow that runs the validation and verification scripts on PRs (I can add an example workflow in `.github/workflows/ci.yml`).

Coding style

- Use EmmyLua-style annotations: `---@class`, `---@param name type`, `---@return type`.
- Prefer `boolean` over `bool` for return types.
- Avoid inline `Number (float)` phrasing — use `number`.

Notes

- Keep `temp_wiki/` updated from the canonical wiki upstream. Consider switching to a submodule to avoid embedding repositories in git.
