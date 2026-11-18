# Issue

**Title:** BF(TST): move and reuse @skip_if_no_psutil for more tests in save

## Description

psutil is an optional dependency (in the [misc] extra), but tests for the openfiles feature unconditionally call get_files_open_for_writing() which raises ImportError without it.

- Move skip_if_no_psutil marker to be defined in datalad/tests/utils_pytest.py
- Register the marker in datalad/pytest_plugin.py
- Apply to tests in test_save.py that need psutil

no changelog  entry needed as we got one already

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d086f3063164`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.