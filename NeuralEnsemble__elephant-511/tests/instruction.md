# Issue

**Title:** WelchPSD, WelchCohere, replace 'hanning' with 'hann', scipy 1.9.0

## Description

**Bug** 
With release of scipy 1.9.0, `signal.windows.hanning` was removed.
See release notes: https://github.com/scipy/scipy/releases/tag/v1.9.0.

Deprecated since: 1.1.0 see: 

See: 

**Fix**  (This  )
- Replaced the default value 'hanning' with 'hann', since hanning is an alias for hann.
- added deprecation warning and unit-tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `646cbd444367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.