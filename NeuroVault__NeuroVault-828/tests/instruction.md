# Issue

**Title:** Additional enhancements to image editing

## Description

- Refactor button logic to apply to all forms
- Refactor view for readability
- Blank out map type and name if image is invalid and its the first time
- Add toggle for Cognitive Atlas to facilitate selecting None / Other and Rest options, and make this compatible with other JS on the page
- Fix metadata copying

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60e9a1a143ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.