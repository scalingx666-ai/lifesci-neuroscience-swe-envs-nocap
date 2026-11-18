# Issue

**Title:** FIX - make ft_hastoolbox('signal') test robust

## Description

## Summary

Issue #2605 explains the problem

The solution was to make the check for availability of the signal toolbox more robust by checking for functions that are not supplied in `external/signal`.

Change ft_hastoolbox('signal') to test for functions that are not provided in external/signal. It tested for window() and hanning(), both of which external/signal provides itself. Once ft_defaults had added that directory the check reported the MathWorks toolbox as present, so the next re-initialisation removed it again and butter, filtfilt and fir1 became undefined. has_license tests the entitlement rather than the installation, so the license half of the check passed even where the product was absent, which is the norm on hosted CI runners.

The same problem might also occur for other toolboxes and the same solution could apply

## Checklist

- [x] I added unit tests and integration tests for each feature (if applicable).
- [x] No error nor warning in the console.
- [ ] I joined a screenshot of the app before and after the fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e14f7291090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.