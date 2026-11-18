# Issue

**Title:** Validate echo counts and TE order when loading data

## Description

.

Changes proposed in this pull request:

- `load_data_nilearn` and `load_ref_img` in `tedana/io.py` raise a `ValueError` when the third dimension of a z-concatenated file is not evenly divisible by the number of echoes. Before, floor division dropped the trailing slices and gave wrong per-echo boundaries with no error.
- `load_data_nilearn` raises a `ValueError` when the number of echo-specific files does not match the number of echo times, before any data loads.
- `check_te_values` in `tedana/utils.py` requires strictly ascending echo times. The `-d`/`-e` help text and `docs/usage.rst` already say echo files come in ascending echo-time order, and the adaptive mask treats the first echo as the shortest. `tedana_workflow` and `t2smap_workflow` both call `check_te_values`, so one check covers both.
- Tests for each check in `tedana/tests/test_io.py` and `tedana/tests/test_utils.py`. All three fail without the source changes and pass with them.

The thread suggests sorting the echo times and reordering the files to match. I used a check instead, because a sort cannot tell a misordered file list from a misordered TE list and can silently break a correct pairing. A single z-concatenated file also cannot be reordered without more code. If you prefer the sort, I can change the TE-order part. The file-count and divisibility checks are needed either way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45dd96d6390f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.