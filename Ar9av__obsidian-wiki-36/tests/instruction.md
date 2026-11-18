# Issue

**Title:** fix: resolve relative manifest paths against OBSIDIAN_VAULT_PATH in daily-update.sh

## Description

## Summary

- Fixes `daily-update.sh` silently under-counting stale sources when `.manifest.json` contains relative paths and the script runs from outside the vault (e.g. launchd default CWD of `/`)
- Passes `OBSIDIAN_VAULT_PATH` into the Python heredoc's environment and joins it onto any relative path before `os.path.exists()` — absolute and `~/…` paths are unaffected
- Implements Option B from the issue (in-loop resolution), which is more defensive than a top-level `cd` and survives any caller that needs to preserve CWD

## Test plan

- [x] Synthetic test confirmed old code from `/` produced `stale_count=1` (only absolute path counted); new code produced `stale_count=2` (relative paths correctly resolved against vault)
- [x] Script runs identically from `/` and from `$OBSIDIAN_VAULT_PATH`
- [x] Non-existent relative paths still silently skipped (no crash)
- [x] Absolute paths unaffected by change

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4fe7144f53c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.