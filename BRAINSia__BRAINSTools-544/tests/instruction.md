# Issue

**Title:** ENH: Add GitHub Actions CI and update Azure Pipelines configurations

## Description

- Introduced GitHub Actions CI workflows for `main` branch with multi-platform support (Ubuntu, macOS, Windows).
- Updated Azure Pipelines configurations to align with modern OS images (`ubuntu-22.04`, `macos-13`, `windows-2022`).
- Standardized dependency installations, CMake configurations, and testing procedures across platforms.
- Improved artifact handling, test result publishing, and code coverage reporting in CI workflows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dc1ff1de481`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.