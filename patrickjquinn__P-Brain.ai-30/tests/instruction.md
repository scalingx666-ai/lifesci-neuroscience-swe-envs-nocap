# Issue

**Title:** Proposed Hard Rule Support + Misc

## Description

Hi Patrick, here's my proposition for hard rule support. Give it a good test and let me know if you think this works better or worse.

Changelist:
- Added hard rule support.
- Removed response/index.js. This loaded a new copy of the skill on each request, it now uses a pre-loaded one.
- Switched classification to remove all '
- Fixed a typo.
- Added extra mordor example.
- Removed examples from initial training set. Examples are now only used for training if one of them is classified incorrectly.

I've kept examples in the modules which have hard rules. This way they can be used as unit tests. If any fail then it throws an error on launch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d5d94a4fa5f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.