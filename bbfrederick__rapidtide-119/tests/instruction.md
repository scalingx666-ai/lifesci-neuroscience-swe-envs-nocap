# Issue

**Title:** Dockermods

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->



Changes proposed in this pull request:
Add code to rapidtide and happy to check if we are running in a Docker container.  If so, set python resource limits so that if we exceed the memory allotted for the container, we fail with a MemoryError (actionable) rather that silently being terminated by the Linux OOM killer (mysterious).
-
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a06960b2fafd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.