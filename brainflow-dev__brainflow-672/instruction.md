# Issue

**Title:** Fixed confliciting name

## Description

Running on MacOs with M2 chip, I was getting the following error while building due to conflict names:

<img width="1238" alt="Screenshot 2023-09-08 at 20 12 14" src="https://github.com/brainflow-dev/brainflow/assets/21221169/f652d74e-5d6b-43f0-98fc-3b15dd09c64a">

Since both `size` and `length` are taken I opted for `num`, but feel free to suggest a different name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a36a42f5c9b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.