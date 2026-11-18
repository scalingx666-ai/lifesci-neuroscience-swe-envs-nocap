# Issue

**Title:** fix(worker): Add authorization tokens for updateValidation and updateSummary

## Description

Use service account credentials when calling updateValidation and updateSummary instead of relying on passthrough credentials.

---

<sub>Stack created with <a href="https://github.com/github/gh-stack">GitHub Stacks CLI</a> • <a href="https://gh.io/stacks-feedback">Give Feedback 💬</a></sub>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43d07b7b85de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.