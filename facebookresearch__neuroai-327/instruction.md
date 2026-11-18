# Issue

**Title:** Remove recursive permission handling; require exca>=0.6.0,<=0.6.2

## Description

Drops the recursive chmod of study folders in favour of exca 0.6's shared-folder setup, which handles group permissions once at the root.

- Require exca>=0.6.0,<=0.6.2 in neuralset, neuraltrain and neuralbench.
- Study downloads no longer recursively chmod 0777; shared roots should instead be initialized once with `exca.utils.setup_shared_folder(root)` and writers run with umask 002.
- Downloads no longer print a `chmod -R 777` hint.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1889d1f336c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.