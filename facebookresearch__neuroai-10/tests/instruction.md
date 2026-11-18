# Issue

**Title:** Fix: quickstart crashes and missing deps

## Description

- Skip study.download() for Fake2025Fmri (raises NotImplementedError)
- Add awscli to Allen2022Massive.requirements (was missing)
- Add neuralfetch[quickstart] extra with all study-specific deps
- Add per-preset install hint comments in generated quickstart code

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `546ca4362689`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.