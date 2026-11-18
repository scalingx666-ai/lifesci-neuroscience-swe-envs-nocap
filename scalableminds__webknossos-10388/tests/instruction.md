# Issue

**Title:** Allow materializing a volume annotation during live collaboration

## Description

### Summary
The "Merge this volume annotation with its fallback layer" item in the layer menu was disabled when simultaneous editing is enabled (and for read-only annotations), because it was grouped with the actions that change the annotation's layer set (#9917). The materialization job only reads the annotation and writes a new dataset, so this restriction isn't needed. The item is now only gated by the existing admin/manager check, as before #9917. The merger-mode materialize button already had no such restriction.

### Steps to test:
- Open an annotation with a volume layer that has a fallback layer and enable simultaneous editing in the sharing settings.
- As an admin/manager, open the layer menu of that volume layer → "Merge this volume annotation with its fallback layer" is enabled and starts the job.
- Same for a locked / read-only annotation viewed as an admin.

### Issues:
-

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf5bce0990b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.