# Issue

**Title:** Remove unused z_maps parameter in calculate_f_maps

## Description

Closes none.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Remove unused `z_maps` parameter in `calculate_f_maps`.
- Remove "map Z" requirement for "map FT2" and "map FS0" metrics.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75a0d48518cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.