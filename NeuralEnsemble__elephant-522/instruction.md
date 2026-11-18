# Issue

**Title:** Fix/CI: update deprecated actions and commands

## Description

- the `set-output` command will be disabled 31st May 2023, see: [changelog](https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/)
- updated `setup-miniconda`  action vo v2.1.1, see: [marketplace conda incubator](https://github.com/marketplace/actions/setup-miniconda)


This is similar to Neo PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ce63bea839`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.