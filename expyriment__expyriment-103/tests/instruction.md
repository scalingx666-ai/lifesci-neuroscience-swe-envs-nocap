# Issue

**Title:** Installation from source archives (e.g. GitHub downloads)

## Description

This is an attempt to have installable source archives (e.g. download from GitHub) with correct version numbers. This is achieved via using the `export-subst` option in git, which will substitute certain fields with certain information when calling `git archive` (which is how GitHub creates their downloads).

---

**Please review/discuss before merging!**

---

# Version number scheme for Releases

1. Wheel
   `0.9.0`

2. Source Distribution
   `0.9.0`

3. GitHub repository
   `0.9.0`

4. GitHub Source Archive
   `0.9.0`

This is all fine. Official releases will have the same version number, revision number and date, no matter from which code you install. That is also true for downloading the `.tar` or `.zip` archive from the GitHub release page.

# Version number scheme for Snapshots

1. Wheel
   `0.9.0-7-g12345678` (alternatives: `0.9.0+` or `0.0.0`)

2. Source Distribution
   `0.9.0-7-g12345678` (alternatives: `0.9.0+` or `0.0.0`)

3. GitHub repository
   `0.9.0-7-g12345678` (alternatives: `0.9.0+` or `0.0.0`)

4. GitHub Source Archive
   `0.9.0-0-g12345678` (alternatives: `0.9.0+` or `0.0.0`, `0.9.0-?-g12345678`)

Here things are a bit more tricky. In particular, the `export-subst` done during `git archive` does not give the full `git describe` information. Hence, creating the version number for Source Archive snapshots (e.g. GitHub download) relies on info in `README.md`. I take the version number from there and put it together with the hash. The missing information is how many commits this is behind the last tag, and I set this part to `0` at the moment.

Alternatively, since the current `git describe` style version numbers for snapshots are not PEP440 compatible anyway, we might want to discuss going to a different scheme altogether, which might also allow to have the same version name for source archives as for the others. See also https://trello.com/c/SrZvRrSf/265-snapshot-version-numbers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68b35f406821`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.