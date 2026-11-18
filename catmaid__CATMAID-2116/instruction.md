# Issue

**Title:** Update packagelist to use python3.8

## Description

3.6 support has been dropped by the latest version of numpy. Although we're not using it yet, this gives us more head room, and is defensive for future changes. Note that 3.9's compatibility with our current `requirements.txt` is a bit more complicated (matplotlib 3.1.2 has no wheels for 3.9, so there are additional build dependencies which seem to be present on github actions, but not in vagrant).

Minor vagrant changes:

- Update to 20.04, using official box from ubuntu
  - Requires use of R v4.0
  - Don't manually resize partitions after disk size change; doesn't seem to be necessary
- Drop `cloud-volume`, which was breaking the provisioning

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4da10b6ad65c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.