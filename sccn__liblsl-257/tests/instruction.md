# Issue

**Title:** Decrease log spam on stream startup

## Description

LOG_F(INFO, ...) and LOG_F(WARNING, ...) → LOG_F(1, ...)

The goal is to eliminate the mostly-uninformative log spam on startup, especially related to ipv6 interfaces not accepting multicast. I've received many questions about these logs -- so it's confusing to users -- and I don't think it's ever helped anyone resolve a problem. They still have some utility for us developers so we should be able to access them in debug mode.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e5ab85c60d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.