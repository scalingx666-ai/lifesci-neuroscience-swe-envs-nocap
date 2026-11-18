# Issue

**Title:** [FIX] RESS: removed hardcoded values

## Description

## Description
- Replaced hardcoded value for `fwhm` when computing left covariance of noise
- Added `peak_width` to set `fwhm` when computing signal covariance (from [Mike X Cohen](http://mikexcohen.com/data/ress.zip))
- Enhanced test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e8c7cfb8383`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.