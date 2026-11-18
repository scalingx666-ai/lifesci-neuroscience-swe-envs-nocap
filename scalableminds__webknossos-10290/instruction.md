# Issue

**Title:** Show toast when annotating outside of the volume layer's bounding box

## Description

### Summary
When a volume annotation stroke changes no voxels and never entered the bounding box of the volume layer (e.g., the task bounding box), a toast now explains that the stroke was outside of the bounding box. It takes precedence over the existing overwrite-mode hint, since changing the overwrite mode wouldn't help in that case.

### Steps to test:
- Open an annotation whose volume layer is restricted by a bounding box (e.g., a skeleton task with a volume layer).
- Brush outside of the bounding box → toast "No voxels were changed, because you annotated outside of the bounding box of this volume layer." appears.
- Brush inside of the bounding box → toast closes.
- With overwrite mode "Overwrite empty voxels", brush over an existing segment inside the bounding box → the existing overwrite-mode toast still appears.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdc127ce117f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.