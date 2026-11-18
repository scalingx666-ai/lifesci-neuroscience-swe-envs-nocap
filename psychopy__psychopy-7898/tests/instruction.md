# Issue

**Title:** fix: Catch use cases where git token expires without refreshing

## Description

Catches the following:
- If computer went to sleep while the app was open, it paused the timer counting down to expiry - so compare against `time.time` instead of relying on a countdown timer
- If token expired during app session and first sync since includes changes, the `User` object used to query previous commits was inherited from the old (now invalid) `Session` object - so now update the existing Session rather than creating a new one (leaving the original object to go stale)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e48eff30422`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.