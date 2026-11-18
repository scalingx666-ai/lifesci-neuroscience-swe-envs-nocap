# Issue

**Title:** updated DESCRIPTION

## Description

- Reformatted `Authors@R` using `as.person` function.
- `Maintainer` field not needed anymore, see http://r-pkgs.had.co.nz/description.html#author
- Added `Date` field because it is required by the `citation` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efe40eb0278b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.