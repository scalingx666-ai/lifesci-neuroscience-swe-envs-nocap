# Issue

**Title:** First crack at new shared memory routines

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes # .

Changes proposed in this pull request:
This updates the multiprocessing shared memory routines to use SharedMemory() rather than RawArray().  This is the newer interface, and is supposed to be safer (and I'm hoping will be deallocated properly on linux hosts).
-
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4ec72133939`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.