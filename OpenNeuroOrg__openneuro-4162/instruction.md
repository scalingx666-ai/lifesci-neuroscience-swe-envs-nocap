# Issue

**Title:** fix(server): Add missing write access checks for metadata, validation, and removePermissions

## Description

Adds missing write guards for addMetadate, updateMosaic, removePermissions, updateSummary, and updateValidation.

Thanks Santosh Kumar Puppala (@Santoshkumarpuppala) for reporting this issue.

---

<sub>Stack created with <a href="https://github.com/github/gh-stack">GitHub Stacks CLI</a> • <a href="https://gh.io/stacks-feedback">Give Feedback 💬</a></sub>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `088a4eacfcb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.