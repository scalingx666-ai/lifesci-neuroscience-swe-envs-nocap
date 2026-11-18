# Issue

**Title:** docs: add BraTS logo and Tokyo Night color theme

## Description

## Summary

Adds the BraTS logo across the project and applies a Tokyo Night color theme to the docs.

### Logo

- Add `docs/assets/brats-logo.png` (source) and `docs/assets/brats-logo.webp` (converted, alpha preserved); remove the stale placeholder `docs/assets/logo.svg`.
- `mkdocs.yml`: set the Material theme header `logo` and `favicon` to the logo.
- `docs/index.md`: replace the ASCII-art banner with a centered logo.
- `README.md`: replace the ASCII-art banner with a centered logo above the "BraTS Orchestrator" title.

### Theme

- Add `docs/stylesheets/extra.css` defining **Tokyo Night Light** (`data-md-color-scheme="default"`) and **Tokyo Night Storm** (`data-md-color-scheme="slate"`) by overriding Material CSS variables: header/tabs, accent, backgrounds and foreground shades, code and syntax highlighting, admonition base colors, footer, and shadows.
- Built-in scheme names are kept so Material scrollbars, `color-scheme` handling, and dark-image logic are retained.
- `mkdocs.yml`: register `extra_css` and set `primary: custom` / `accent: custom` for both palettes.

## Notes

- The README references the logo via the absolute `raw.githubusercontent.com/.../main/...` URL so it renders on PyPI; the image only resolves once this lands on `main`.
- Admonition flavors (`note`, `tip`, `warning`, ...) intentionally keep Material defaults; only the base admonition foreground/background follow the scheme. `important` is not styled by Material and renders without an icon (pre-existing, left as-is).
- `uv run mkdocs build --strict` passes.

## Test plan

- [x] `uv run mkdocs build --strict`
- [x] `uv run pre-commit run --files docs/stylesheets/extra.css mkdocs.yml`
- [ ] Visual check of light/dark docs preview
- [ ] Visual check of README after merge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a0308e4ac70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.