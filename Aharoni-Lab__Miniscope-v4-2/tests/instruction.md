# Issue

**Title:** Size update

## Description

Things added:

- New coax connector (U.FL-R-SMT-1 from Hirose)
- New pad at the bottom for extra connections
- Power planes

To do:

- Check serializer footprint
- Correct track sizes
- Check via drill sizes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ddbdb8a9695`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.