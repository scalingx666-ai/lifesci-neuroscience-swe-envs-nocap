# Issue

**Title:** ENH: Update coveralls version

## Description

Bumping the version, hoping to avoid coverage errors.

On coveralls.io, docstrings are being interpreted as uncovered code. This seems to only be a problem on multi-line function definitions.

https://coveralls.io/builds/66464549/source?filename=home%2Frunner%2F.local%2Flib%2Fpython3.10%2Fsite-packages%2Fants%2Fsegmentation%2Fatropos.py

I don't see this issue on my local machine if I run the tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb70f4a5c276`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.