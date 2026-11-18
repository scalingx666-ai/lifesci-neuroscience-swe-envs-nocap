# Issue

**Title:** Prefetch the NEMAR sourcedata files no subject owns (Brandl2020 fetched mnt.mat from DepositOnce)

## Description

`get_data()` prefetches each subject's NEMAR `sourcedata/` using the deposit's `sourcedata_provenance.json`, selecting the files whose `subject` matches. Some deposits also list files that belong to no subject (`"subject": null`): montages, band and interval definitions, shared tables. Every subject's load reads them, but the prefetch never fetched them. So the loader went to the upstream host for them under `"auto"`, or failed under `"nemar"`.

Found by an audit of every dataset with a `nemar_id` (Voyager, first subject, empty cache, every HTTP request logged). On develop, Brandl2020 got `pp1.mat` (651 MB) from NEMAR, then fetched `mnt.mat` from `api-depositonce.tu-berlin.de`. `nm000329` lists that file with `subject: null`, together with `bands.mat` and `ivals.mat`. The same shape is in Dreyer2023 (`performance.csv`) and Yang2025 (404 small metadata files, 0.4 MB).

### Change
- `_manifest_shared_files(record)` returns the files with a missing or empty `subject`, but only for manifests that record subjects at all. Manifests without subjects keep the existing whole-tree rule.
- `_sourcedata_files_for_subject` adds those files to the subject's include patterns. A subject that owns no files still raises `lists no sourcedata for subject`.
- `nemar_sourcedata_is_local` reports a subject as local only once the shared files are there too.

### Verification
This branch alone on develop (Voyager, first subject, empty cache):

| Dataset | develop: class, upstream hosts | this branch: class | sessions/runs develop -> branch |
|---|---|---|---|
| Brandl2020 | nemar+upstream (api-depositonce.tu-berlin.de) | nemar_only | 1/7 -> 1/7 |
| Dreyer2023 | nemar_only (-) | nemar_only | 1/6 -> 1/6 |

Yang2025 (404 shared metadata files) is still stopped at 20 GB: its loader downloads the whole-dataset figshare ZIP. That is a separate cause and is not changed here.

### Tests
`moabb/tests/test_nemar_shared_files.py` (offline, 4 tests): shared files are selected, shared files do not make an unknown subject valid, a store missing them is not local, manifests without subjects are unchanged. The tests fail without the change. `test_download.py`: 271 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc7eb937c772`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.