# Issue

**Title:** add reference_range param

## Description

add control to set amplifier reference range. Accessible values are 1.0, 0.75, 0.15 Volt. I also change the default sampling rate from 2000Hz to 512Hz.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ee3072c4543`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.