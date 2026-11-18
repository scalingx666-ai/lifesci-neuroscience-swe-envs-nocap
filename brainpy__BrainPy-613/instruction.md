# Issue

**Title:** [math] Implementing event-driven sparse matrix @ matrix operators

## Description

- [x] csr matmat
- [x] event csr matmat
- [ ] jitconn csr matmat
- [ ] jitconn event csr matmat
- [ ] optimize all operators above

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3a854af9589`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.