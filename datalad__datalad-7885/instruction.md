# Issue

**Title:** NF: avoid crash on get_toppath  - return `None` on non-existing path

## Description

When get_toppath() is called on a nonexistent path, the OSError handler recurses to parent directories via dirname(). If no ancestor has a .git, the recursive call returns None, and str(Path(None)) raises TypeError.

Fix: return None early when the OSError fallback also returns None.

This is an invited (by @yarikoptic) follow-up to the gh-7882 symlinked-dataset fix: the OSError handler's upward walk was what caused the wrong parent .git to be found when the original path was a broken symlink.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ecccaf144db3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.