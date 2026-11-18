# Issue

**Title:** use unit consistently across conditionals in `atlas_name_from_repr`

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

A small bug is blocking #587 : `atlas_name_from_repr` it _should_ always return a unit in the atlas name representation, but it currently only does so only if you also specify major and minor version.

**What does this PR do?**

Tiny bugfix in utility function used by wrapup: `atlas_name_from_repr` always returns unit irrespective of whether minor and major versions are specified or not, making the behaviour consistent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70c4338a46e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.