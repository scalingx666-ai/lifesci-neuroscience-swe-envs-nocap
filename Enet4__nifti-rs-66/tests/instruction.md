# Issue

**Title:** Less dependencies

## Description

Remove num and some default features. Not much but a `cargo build --release --features ...` was 2.5s faster on my work computer.

I tried getting rid of `nalgebra` because it's huge, I'm not using much of it (3x3 and 4x4 matrix, inverse, eigen and SVD) and we need to update it from time to time ... but it seems like an impossible job. The best I could find was `default-features = false` and it's not doing much!

I'll send a `nalgebra` update PR soon (0.18 to 0.21), if it's ok with you. EDIT: we might as well update all dependencies...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa1c39363890`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.