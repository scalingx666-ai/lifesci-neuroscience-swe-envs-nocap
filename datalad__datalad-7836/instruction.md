# Issue

**Title:** BF(TST): skip openfiles tests when psutil is not installed

## Description

psutil is an optional dependency (in the [misc] extra), but test_openfiles.py tests were unconditionally calling get_files_open_for_writing() which raises ImportError without it. Mark tests that need psutil with `@skip_if_no_psutil` skipif marker so they are skipped rather than failing when psutil is absent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b114da2af5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.