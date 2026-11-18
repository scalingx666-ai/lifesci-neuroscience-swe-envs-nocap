# Issue

**Title:** ENH: Fix workflow actions warnings linked to `Node.js`

## Description

Fix format linter and testing  workflow actions warnings linked to `Node.js`: bump `actions/setup-python` to v5.

Take advantage of the commit to bump `actions/cache` to v4.

Fixes:
```
Node.js 16 actions are deprecated.
 Please update the following actions to use Node.js 20:
 actions/setup-python@v4.
 For more information see:
 https://github.blog/changelog/2023-09-22-github-actions-transitioning-from-node-16-to-node-20/.
```

raised for example in:
https://github.com/SlicerDMRI/whitematteranalysis/actions/runs/9719632509

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39a54750106e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.