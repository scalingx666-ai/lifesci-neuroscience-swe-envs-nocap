# Issue

**Title:** Speed up interpolation picking

## Description

Just a small speedup / cleanup to the new interp code. Wrangling the `info` becomes expensive due to `pick_info` doing copies and consistency checks, so avoid some `pick_info` calls (by using a little helper to check for `bads` membership) and call the consistency check once at the beginning of the interp loop to get to speed parity (last two columns use  to take advantage of the new API):

| Channels | autoreject `main` | MNE `main` | This PR |
|---|---|---|---|
| EEG (59 channels) | 1.969 ± 0.084 s | 2.024 ± 0.026 s | 1.880 ± 0.026 s |
| MEG (305 channels) | 18.441 ± 0.122 s | 20.929 ± 0.064 s | 18.115 ± 0.102 s |

Drafted with Claude Opus 5.5 and reviewed by me. A pretty trivial change (most of the 37 lines changed are whitespace) so I'll self-mark for merge-when-green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `506d740fbcb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.