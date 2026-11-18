# Issue

**Title:** CI: run the comma-locale tests on Linux

## Description

The locale-independence tests added in #310 switch `LC_NUMERIC` to a comma-decimal locale and skip themselves when none is installed. Ubuntu runners have none, so on Linux they printed "No comma-decimal locale installed" and skipped; only Windows and macOS ran them. This generates `de_DE.UTF-8` before the unit tests on the native Ubuntu jobs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79fa78515b4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.