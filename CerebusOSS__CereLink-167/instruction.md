# Issue

**Title:** Reduce macOS CLIENT mode shmem polling latency from 10ms to <1ms

## Description

macOS lacks sem_timedwait, so waitForData() used sem_trywait with a 10ms usleep loop, adding ~12ms latency to every CLIENT receive cycle.

Replace with a 500µs poll using clock_gettime_nsec_np for an accurate monotonic deadline.  CLIENT mode latency drops from 12ms to <1ms, matching STANDALONE performance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da5ba852efe9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.