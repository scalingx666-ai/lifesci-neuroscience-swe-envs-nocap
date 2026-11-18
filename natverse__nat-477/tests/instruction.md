# Issue

**Title:** GitHub actions with codecov

## Description

Same as #475 but with codecov.

Sorry for cluttering with yet another PR @jefferis but just wanted to give an alternative to coveralls in case we don't solve the token conundrum.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a155984fa0cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.