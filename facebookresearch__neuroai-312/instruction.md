# Issue

**Title:** Bump versions to 0.4.0

## Description

Bumps the four packages and their inter-package pins to 0.4.0 and moves the `[Unreleased]` CHANGELOG entries under `[0.4.0]`. Minor bump because of breaking changes (e.g. `neuralbench.defaults.metrics` → `neuralbench.metric_configs`, the retrieval headline metric, the `--plot-cached` output layout).

To merge after the Biosignal Challenge 2026 tasks are validated on main; the CHANGELOG date is set to the planned release day and should match the merge date.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07da437f0fb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.