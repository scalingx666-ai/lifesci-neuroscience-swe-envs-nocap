# Issue

**Title:** Add browser raw capture extension

## Description

## What changed

- Added a zero-build Chrome extension under `extensions/brain-capture/` for capturing pages and selected text into the vault `_raw/` folder.
- Added popup UI, context-menu capture actions, extension icons, and local `_raw` folder selection via Chrome's File System Access API.
- Documented install, capture, raw-path lookup, and post-capture `/wiki-ingest promote my raw pages` workflow in README docs.

## Why

This gives the wiki a browser-native capture path for web pages and selected snippets while keeping captured material staged in `_raw/` until an agent promotes it into structured wiki pages.

## Validation

- `node --check extensions/brain-capture/popup.js`
- `node --check extensions/brain-capture/background.js`
- `node -e "JSON.parse(require('fs').readFileSync('extensions/brain-capture/manifest.json','utf8')); console.log('manifest ok')"`
- `git diff --cached --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4d27ecdc7a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.