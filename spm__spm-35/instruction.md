# Issue

**Title:** Test: Add macos-latest as target

## Description

macos-latest uses Apple Silicon hardware and is supported since Matlab R2023b
It's probably best to test both, macos-13 (Intel) and macos-latest (Apple Silicon)

macos-latest requires matlab-actions/run-command@v2, which was only possible to add with some more code duplication. It is probably still better than having two separate workflows.

It was tested here: https://github.com/korbinian90/spm/actions/runs/10062331645

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2dbc8c181eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.