# Issue

**Title:** FIX: Don't let lock files persist in BIDS datasets

## Description

Found `SoftFileLock` on the filelock doc:

- https://py-filelock.readthedocs.io/en/latest/api.html#filelock.SoftFileLock
- https://py-filelock.readthedocs.io/en/latest/how-to.html#detect-stale-locks-soft-locks-only

IIUC this will remove the lock file for us when the process that created it finishes. 

The important thing for the team to know is that `SoftFileLock` uses a different locking mechanism than `FileLock`. `FileLock` will use OS-level locking mechanisms, `SoftFileLock` uses the existence of the lock file itself as the locking mechanism.

Using `SoftFileLock` makes the tests pass again locally. If the CI's pass too, I think this is one way to fix the issue, but maybe in the medium-to-long-term there are better ways, (EDIT) as I imagine that the [concerns about unlinking ](https://py-filelock.readthedocs.io/en/latest/api.html#filelock.UnixFileLock)a lock file on unix systems still applies when using `SoftFileLock`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73ee63730e44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.