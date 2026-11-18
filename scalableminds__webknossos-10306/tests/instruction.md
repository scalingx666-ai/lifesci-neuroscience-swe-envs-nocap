# Issue

**Title:** Bump backend dependencies, drop commons-email, use jakarta/angus directly

## Description

### Summary
 - standard minor version bumps
 - bump jackson override to newest version
 - drop commons-email, use newest jakarta directly (implementation now named angus) – this needed a rewrite of Mailer.scala, I’d argue it’s actually a little cleaner now.

### Steps to test:
(I tested locally)
- set up smtp credentials
- send some test emails

------
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)
- [x] Needs datastore update after deployment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8cdf97a19b23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.