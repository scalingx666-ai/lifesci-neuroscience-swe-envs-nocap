# Issue

**Title:** specify utf-8 explicitly when packaging atlases

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
Encoding seems to have occasionally caused problems during wrapup for specific atlases (#587 and  I think)... maybe because some of the original data was encoded with `ascii`- but I never fully managed to get to the ground of this.

**What does this PR do?**
Explicitly sets encoding to `utf-8` for all reading and writing operations of metadata files during atlas packaging.

## How has this PR been tested?

Rebasing on this branch was necessary to create the atlas contributed in #587 

## Is this a breaking change?

It shouldn't be.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70c4338a46e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.