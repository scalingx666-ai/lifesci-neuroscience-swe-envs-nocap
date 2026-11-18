# Issue

**Title:** WebGL viewer: fix help-menu shortcut display

## Description

## Summary

This PR fixes several long-standing display bugs in the WebGL viewer's `h` help menu. 

## Bug fixes (ready to merge)

Small, self-contained diff in `mriview.js` + `mriview.css`:

1. **Shortcut key casing.** The help generator rendered every key with `key.toUpperCase()`. The viewer binds *both* plain lowercase keys (`r`, `s`, `l`, `h`, …) **and** genuinely Shift-modified ones (`key:'R'/'S'/'L'` with `modKeys:['shiftKey']` — these are *different* commands, e.g. toggle right hemisphere). Uppercasing made the two indistinguishable in the menu (both shown as `R`/`S`/`L`), and the help toggle `h` was shown as `H` (implying Shift+H). The binding data already carries the correct case, so we now render the key verbatim.
2. **Modifier-label casing.** `shiftKey` now renders as `Shift` instead of `shift`.
3. **Panel position.** `#helpmenu` was pinned to the left edge (`left:0%`), so its lower half slid behind the lower-left legend. It's now centered (`left/top:50%` + `translate(-50%,-50%)`).
4. **Panel font.** `#helpmenu` set no `font-family`, so it fell back to the browser-default serif (Times in Firefox) while the rest of the UI is sans-serif. Now explicitly sans-serif.

_(Note on Firefox scroll-zoom: it's **already** correct on `main` — the active camera controller in `movement.js` uses the standard `wheel`/`deltaY`. Only the legacy `LandscapeControls.js`, used by `simple.html`, still reads the WebKit-only `wheelDelta`, so it's intentionally left out of this PR.)_

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fe15c30e324`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.