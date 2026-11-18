# Issue

**Title:** feat(fft): switch to scipy.fft; mirror CPU/GPU imports

## Description

## Summary
- Replace deprecated `scipy.fftpack` with modern `scipy.fft` imports
- CPU/GPU import symmetry maintained (`scipy.fft` vs `cupyx.scipy.fft`)
- Tests pass with no new failures

## Test plan
- [x] Replaced `scipy.fftpack` with `scipy.fft` in transforms.py and tests
- [x] CPU/GPU import symmetry maintained
- [x] Tests pass locally (same 3 pre-existing failures, no new ones)

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f6c09500d38`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.