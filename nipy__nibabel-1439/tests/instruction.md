# Issue

**Title:** macOS updates

## Description

[GitHub Actions: macOS 13 runner image is closing down](https://github.blog/changelog/2025-09-19-github-actions-macos-13-runner-image-is-closing-down/)

Also, following  stop testing Python 3.13 since the newest 3.14 is tested
> \# Use ubuntu-latest to cover the whole range of Python. For Windows
> \# and OSX, checking oldest and newest should be sufficient.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `132ded6fa757`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.