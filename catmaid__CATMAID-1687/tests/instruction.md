# Issue

**Title:** Feature/1683 move node z

## Description

Holding `Alt` while using `,` and `.` now move the active node in z. The stack viewer then centers on the new node location.

I thought centering on the new location would be better than just moving in Z just to be extra clear on where the node is ending up, as it seems like it would be easy to lose track of nodes using this feature. However, I'm not totally set on it, because it also makes it easier to lose track of everything *else*.

P.S. Sorry for the dirty log, something went weird in my initial rebase on dev.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cff37193ff8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.