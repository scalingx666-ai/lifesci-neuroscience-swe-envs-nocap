# Issue

**Title:** Task 3: wall-follow + collision reflex (~15.14 ± 0.13)

## Description

- Task: 3 (Valued decision)
- File: braincraft/env3_player_wallfollow.py
- Score: 15.14 ± 0.13 over 10 runs seeded with 12345 before train() + evaluate.
- Method (short): Hand-crafted linear controller (no recurrence: W=0, f=g=identity, leak=1, warmup=0) using only the bump sensor (hit) plus a single right-side depth ray (side_idx=52) to wall-follow and repeatedly cycle over energy sources.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ebb054556e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.