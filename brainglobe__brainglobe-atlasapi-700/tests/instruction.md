# Issue

**Title:** Fix crash on incomplete atlas downloads

## Description

# PR Type

* [x] Bug fix
* [ ] Addition of a new feature
* [ ] Other

# Why is this PR needed?

Currently, if an atlas download is interrupted or results in a corrupted file, the application crashes with a `tarfile.ReadError` or `EOFError` during extraction because the downloaded file is not validated. This leaves a corrupted file on disk, preventing subsequent retries from succeeding without manual intervention. This PR addresses **Bug #698**.

# What does this PR do?

This PR introduces **integrity validation for downloaded atlas tarballs** before extraction:

* Wraps the extraction process in a `try-except` block to catch `tarfile.ReadError`, `CompressionError`, and `EOFError`.
* Automatically deletes corrupted files if validation fails, allowing clean retry downloads.
* Raises a descriptive, user-friendly error message when corruption is detected.
* Preserves the valid downloaded file upon successful extraction to ensure caching works as intended.

# References

* 

# How has this PR been tested?

Two new test cases were added in `tests/atlasapi/test_bg_atlas.py`:

1. **`test_download_corrupted_file`**

   * Mocks a corrupted download (truncated gzip).
   * Verifies that `tarfile.ReadError` is raised.
   * Checks that the corrupted file is deleted from disk.

2. **`test_download_valid_file`**

   * Mocks a valid download.
   * Verifies extraction succeeds.
   * Confirms the original archive persists on disk.

All tests were run locally using `pytest`:

```bash
python -m pytest tests/atlasapi/test_bg_atlas.py -v
```

Result:  All tests passed

# Is this a breaking change?

No. It improves robustness of existing functionality.

# Does this PR require an update to the documentation?

No. This is an internal fix to handle errors more gracefully.

# Checklist

* [x] The code has been tested locally
* [x] Tests have been added to cover all new functionality
* [x] Documentation updated if necessary (N/A)
* [x] Code has been formatted using pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5508e5525af6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.