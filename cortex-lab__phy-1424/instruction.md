# Issue

**Title:** Bump tornado from 6.5.8 to 6.5.10

## Description

Update the locked Tornado dependency from 6.5.8 to 6.5.10.

6.5.9 contains security fixes, but also introduced a Jupyter compatibility regression. 6.5.10 retains those fixes and restores compatibility. Use 6.5.10 for phy's Qt console and IPython/Jupyter dependencies.

- [6.5.9 release notes](https://www.tornadoweb.org/en/stable/releases/v6.5.9.html)
- [6.5.10 compatibility fix](https://www.tornadoweb.org/en/stable/releases/v6.5.10.html)

The original macOS/Python 3.12 failure was in a timing-dependent debouncer assertion. #1425 corrects that test and an application-creation test; this branch includes the updated master with those corrections. Relative to current master, this PR changes only Tornado's lockfile entry.

Validation: frozen uv sync, lint, formatting, all 16 Qt utility tests, and uv build passed locally. The integrated phy 2.2 workflow suite also passed against Tornado 6.5.10 and phylib 2.7.1 (495 core/GUI and 155 application tests, one existing visual benchmark skipped). Fresh cross-platform CI is required before merge.

## Execution — 8 October 2026

The refreshed full CI matrix, documentation, spelling, and package build passed on `1a478663`. Merged Tornado 6.5.10 as `d198375d`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fa42987fa6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.