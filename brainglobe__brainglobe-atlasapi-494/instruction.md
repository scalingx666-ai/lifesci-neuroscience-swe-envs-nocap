# Issue

**Title:** Ignore atlas packaging scripts in test coverage

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
We want to have a realistic figure of coverage that is not influenced by the atlas packaging scripts. We should still test the general purpose validation and utilities of the atlas packaging in `atlas_generation`.

**What does this PR do?**
Removes the `atlas_scripts` from coverage, following [these codecov docs](https://docs.codecov.com/docs/ignoring-paths). Can be verified by looking at [this PR's codecov page](https://app.codecov.io/gh/brainglobe/brainglobe-atlasapi/pull/494/indirect-changes).

Note: I've also updated the settings for `brainglobe-atlasapi` to look at `main` instead of `master` by default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2efb0ff6b5dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.