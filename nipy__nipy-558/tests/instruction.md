# Issue

**Title:** MNT: Test and advertise support for Python 3.8+

## Description

Nipy builds and tests clean on Python 3.8, so this just acknowledges and advertises that. We could also follow [SPEC0](https://scientific-python.org/specs/spec-0000/), which would have us drop Python <3.10 at this point. IMO Nipy doesn't need to be as conservative as nibabel here, so bumping to 3.10+ would be fine.

Fix picked up by `ruff` included.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca70df937b69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.