# Issue

**Title:** handle sbx files with unidirectional scanning directly from the gui

## Description

This is related to #287. This solution assumes that this only happens for files recorded using a specific scanning mode. Another solution is to expose sbx_ndeadcols in the GUI so that the user can specify the value manually. I prefer keeping this out of the GUI unless needed because it is used only for sbx files.

Summary:
- Check scanmode ~= 1 for sbx before computing sbx_ndeadcols if -1.
- Removed duplicate sbx entry on the GUI menu.
- Removed file path print on sbx load.
- Removed ops['lines'] print on GUI add_ops (was causing GUI crash).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c24eed39e1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.