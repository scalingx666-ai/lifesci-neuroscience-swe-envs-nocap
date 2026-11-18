# Issue

**Title:** Localserver for elephant-dataset

## Description

# Desc
- `TestDownloadDatasets` in `elephant/test/test_datasets.py` downloaded `dataset-1/dataset-1.h5` from GIN on every test run. On GitHub runners GIN often answers with `HTTP Error 403: Forbidden` (likely rate limiting / blocking of runner IPs),so the 5 `test_valid_data*` tests fail

- Additionally, these tests used `patch.dict(os.environ, {...}, clear=True)`. On Windows, clearing the environment also removes `SystemRoot`, which is needed for networking. When such a test is the first one in the process to open a connection, it fails with `[Errno 11001] getaddrinfo failed` instead of reaching the server. This has been hidden so far because other test modules happened to open a connection first.

- All HTTP errors on the versioned fetch fallback to trying to retrieve from master in datasets.py, only a 404 [not found] should fallback to master

# Changes
1. `elephant/datasets.py`: the default root URL is now a module constant `ELEPHANT_DATA_ROOT_URL`, read at call time, so tests can patch it.
2. `TestDownloadDatasets` serves a minimal mock `elephant-data` from a local `http.server` on `127.0.0.1` and patches `ELEPHANT_DATA_ROOT_URL` to it, so no test in the class contacts GIN.
   The mock serves `raw/master/...` and one fake version `raw/v9.9.9/...` (with `README.md`), with different content, so tests can tell which one was downloaded.
3. Removed `clear=True` from all `patch.dict(os.environ, ...)` calls; only `ELEPHANT_DATA_ patched now.
4. Add a guard to fallback only on 404 and raise exception on any other HTTP error.
5. New tests for the version probe in `download_datasets`:
   - `test_valid_data_versioned`: version exists, so no warning
   - `test_valid_data_version_fallback`: version missing (404), so `UserWarning`, falls back to master
   - `test_valid_data_version_forbidden`: access forbidden, raise exception. doesn't fall back to master
6. New opt-in `TestGinConnectivity` (skipped unless `ELEPHANT_NETWORK_TESTS=1`), so the real GIN connectivity is still covered end to end, this will be run only on  `canary_ci.yml` and not on regular CI. These tests also only warn instead of failing the CI.

# To-Do
- [x] HTTP exception on datasets.py:412 for README.md
- [x] Verify Canary step verified on a GitHub runner - [Tested](https://github.com/NeuralEnsemble/elephant/actions/runs/41609263491/job/125826757611)
- [x] Any other end-to-end check needed on GIN connectivity?
- [x] Should GIN failure in canary be a warning, or fail the whole pipeline?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32f1b56fa104`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.