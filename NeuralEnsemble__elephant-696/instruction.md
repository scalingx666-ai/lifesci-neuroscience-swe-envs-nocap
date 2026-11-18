# Issue

**Title:** Updating GitHub cache action to v5

## Description

# Desc

* Observing unexpected cache misses even when the input key was available.
* GitHub giving out warnings related to Node.js 20 deprecation in the runner environment that is used in current v4 of cache action

# Fix
Just version bumping cache action to v5, I’ll merge this once checks pass, so skipping review due to minor change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `645a1fa743db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.