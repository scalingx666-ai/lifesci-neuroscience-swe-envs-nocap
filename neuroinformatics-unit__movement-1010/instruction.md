# Issue

**Title:** Add pre-commit hook to prevent hardcoded movement website references in docs

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

**Why is this PR needed?**
 

A simpler alternative to #765 that uses pre-commit to catch hardcoded movement website references in all files in docs, except for conf.py.

## How has this PR been tested?
commit fails when I try to add https://movement.neuroinformatics.dev/latest/examples/index.html in docs/source/index.md
<img width="1047" height="191" alt="image" src="https://github.com/user-attachments/assets/1961fdea-7a0e-456f-8472-726be3730007" />

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d922d01a3c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.