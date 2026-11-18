# Issue

**Title:** Backport protocol 3.11

## Description

This adds an option to set a preprocessor directive `CBPROTO_311` and, when it is set, CereLink will be compatible with protocol 3.11 (found on firmwares 7.0x).
 

I will not be adding Python support to the 3.11 support, so I may never merge this PR. I'll keep this PR here though to rebase when master changes.

TODO:
- [ ] ~Modify CI script for additional `-DCBPROTO_311=ON` builds with well-named artifacts~ <-- Not in this PR.
- [ ] ~cerebus.cbpy built for protocol 3.11~ <-- I do not plan on doing this

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1eae8e5104c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.