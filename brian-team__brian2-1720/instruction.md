# Issue

**Title:** Standalone: expose and store internal state

## Description

This PR does not add any user-facing changes, but prepares future features for `store`/`restore` and similar functionality in C++ standalone mode. With this PR, the random number generator and the spike queue can serialize their state, and also restore their state from a serialization. At the end of a run, the states are written to disk for both.

At the moment, this state is not used for anything, but it gives the opportunity to play around with this feature in custom code (`device.insert_code`, etc.). I wanted to push this first before working on the bigger `store`/`restore` issue, because the latter has a number of syntax and semantic questions to decide first, and we shouldn't rush those.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebfcdbc94f8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.