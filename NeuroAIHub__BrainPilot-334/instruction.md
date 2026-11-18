# Issue

**Title:** fix(web): make Settings dialog usable on mobile viewports

## Description

## Summary

- Below **860px**, Settings drops the fixed 190px side nav in favor of a horizontal, scrollable section strip so the content pane is full-width.
- Reflows provider/MCP action grids, split preference fields, list items, nested form grids, and KB fact rows so controls are not clipped at **390 × 844**.
- Desktop two-column IA above 860px is unchanged; active tab gets `aria-current="page"`.

## Test plan

- [x] `packages/web` vitest (307 tests, including 6 new CSS contract tests)
- [x] `packages/web` `tsc --noEmit`
- [ ] Manual **390 × 844**: Providers / Tools / KB / Preferences readable and operable; no 1-char wrap
- [ ] Manual **768 × 900**: stacked mobile layout, tabs scroll, close works
- [ ] Manual **1280 × 720**: desktop side nav + content unchanged
- [ ] Keyboard: tab through sections + close; content scrolls

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e6ac639766e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.