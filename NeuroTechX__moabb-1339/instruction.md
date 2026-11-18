# Issue

**Title:** Fix BNCI2014_001 auxiliary EOG metadata

## Description

.

The BNCI2014_001 auxiliary-channel metadata currently says EOG is absent, while its declared channel types, sensor names and loader all specify three EOG channels. This changes only the auxiliary presence flag and count to `has_eog=True, eog_channels=3`.

Validation: checked against the current develop file (Git blob `c8ac69978f3fb1736923e067a1d3c38a18f39b8c`); both versions parse, and a complete AST comparison is identical after normalising only this auxiliary-channel call. No dataset loading, MOABB runtime test or benchmark was run. No loader behaviour or performance effect is claimed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bed9f0fa1b9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.