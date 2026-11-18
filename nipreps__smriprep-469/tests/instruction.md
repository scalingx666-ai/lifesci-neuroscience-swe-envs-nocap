# Issue

**Title:** chore(ci): Increase test timeout to 30m (~2x median)

## Description

Hitting 20m timeout. Most runs finish in the 16-17m range, so 30m is a safer indicator that something is actually wrong.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f16768bd2cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.