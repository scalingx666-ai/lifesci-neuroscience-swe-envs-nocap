# Issue

**Title:** CI: use step-security/msvc-dev-cmd instead of abandoned original

## Description

Avoids node.js 20 deprecation issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c582a0c57311`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.