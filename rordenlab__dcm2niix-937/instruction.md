# Issue

**Title:** build fixes

## Description

- fix missing `#define SHRT_MAX` (was nested in wrong `#if`)
- drop Python 3.6 (required for #936)
  + minor python syntax linting
- CI: test `development` branch

Tested & working in the fork at [AMYPAD:runs/15186216375](https://github.com/AMYPAD/dcm2niix/actions/runs/15186216375)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75a337b1f14a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.