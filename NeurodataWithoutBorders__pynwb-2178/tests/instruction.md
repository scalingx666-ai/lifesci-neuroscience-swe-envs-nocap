# Issue

**Title:** Update ReadTheDocs build image to Ubuntu 24.04

## Description

## Summary
- Update ReadTheDocs build OS from `ubuntu-20.04` to `ubuntu-24.04`
- Bump Python version from 3.11 to 3.13

## Background

ReadTheDocs is deprecating the Ubuntu 20.04 LTS build image. After June 1, 2026, projects still using `ubuntu-20.04` will fail to build. Ubuntu 20.04 is no longer receiving security updates.

See: https://docs.readthedocs.io/en/stable/config-file/v2.html#build-os

## Test plan
- [x] Verify ReadTheDocs build succeeds with the new configuration

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75e544d815e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.