# Issue

**Title:** Fix muddy title color in AI services popover

## Description

### Summary
The service titles in the "Need help with your data?" popover (AI job drawer) mixed the cyan brand color into the text color, which looked muddy in light mode. The titles now use the regular text color; only the badge dot stays cyan.

### Steps to test:
- On a webknossos.org instance, open the AI job drawer and click "Need help with your data?"
- Check the "Custom model training" and "Alignment" titles in light and dark mode

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `253a42eab4c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.