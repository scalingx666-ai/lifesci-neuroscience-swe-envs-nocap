# Issue

**Title:** Fix macOS CI failures

## Description

## Desc
Currently there are two issues with macOS  CI pipeline
### Exact floating point comparisons in unit tests breaking in macOS
 - Potentially numerical back-end in arm mac's causing this mismatch
 - Fix is to use allclose comparisons from numpy
### macOS arm64 wheel build fails
- `libomp` dependency does not satisfy target macOS version 15.0, as host runner is macOS 26.0
- Fix is to use a custom runner rather than macos-latest, i.e. macos-15.0 so that host and target agree

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73111ffc17df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.