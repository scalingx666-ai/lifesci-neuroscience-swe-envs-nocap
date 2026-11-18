# Issue

**Title:** ci: use CPU torch on GitHub runners to stop random CUDA-preload segfault

## Description

## Problem
Tests on GitHub runners crash at random with `Fatal Python error: Segmentation fault` inside `torch._preload_cuda_lib` (`torch/__init__.py:348`), before any test runs. The runners have no GPU, but `poetry.lock` installs the CUDA 13.0 build of torch. Seen on master `7cac0c3` and on Dependabot PRs #804 and #805 (lock-only bumps of tornado/virtualenv, unrelated to torch).

## Fix
`.github/scripts/use_cpu_torch.sh` runs after `poetry install` in both test workflows. It reads the installed torch/torchvision versions from package metadata (without importing torch), reinstalls those same versions from the CPU wheel index, and fails the job if the resulting torch still reports CUDA.

Local installs and `poetry.lock` are unchanged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c6ede64dce80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.