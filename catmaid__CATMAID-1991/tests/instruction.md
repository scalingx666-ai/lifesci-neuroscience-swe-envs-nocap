# Issue

**Title:** Vagrant update

## Description

Scripts:

- remove hardcoded postgres versions
- Postgres listens on 5555 on the guest as well as the host
- optional.sh can move existing settings files

Docs:

- Require VirtualBox
- Note incompatibility with Docker on windows
- Note possible BIOS settings
- Document VM snapshotting

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdf2ecd9adc9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.