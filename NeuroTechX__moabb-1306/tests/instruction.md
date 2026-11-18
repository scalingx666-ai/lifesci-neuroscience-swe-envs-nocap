# Issue

**Title:** NEMAR sourcedata: a provenance entry may name several subjects (Zheng2020 pairs)

## Description

Draft: not to be merged yet (the NEMAR side change it pairs with is staged, not pushed).

### What

A NEMAR `sourcedata_provenance.json` entry can now name several subjects: `"subjects": [...]` (or a list in `"subject"`). The file then belongs to the per-subject prefetch, the local check and the cache seeding of each listed subject, and is no longer counted as a shared file.

`_entry_subjects(entry)` returns the labels an entry is filed under (scalar or list `subject`, plus `subjects`); `_manifest_subject_files`, `_manifest_shared_files`, the "Known subjects" message and `seed_loader_cache` use it. Scalar-`subject` manifests behave exactly as before.

### Why

`Zheng2020`: each upstream `G{g}/G{g}D{1,2}.mat` holds both members of pair `g` (subjects `2g-1` and `2g`, `_SUBJECT_MAP`). Its deposit `nm000205` records no subject, so loading any one subject prefetches the whole `sourcedata/` (14 files, 7.07 GB). With one `subject` per entry, labelling a file with one member leaves the other with no files. With `"subjects": ["13", "14"]` on `G7/G7D{1,2}.mat`, subject 14 fetches and seeds 2 files (~0.78 GB).

### Back-compat: which format the deposit uses

What released MOABB does with each format, for subject 13 (offline probe of the v1.6.0, v1.6.1, v1.7.0, v1.7.1 and v1.7.2 trees: `_sourcedata_files_for_subject` on a local manifest, and `Zheng2020()._prefetch_nemar_sourcedata([13])` with `nemar.download` stubbed):

| manifest format (nm000205 entries) | v1.6.0 - v1.7.2 and develop: files for subject 13 | prefetch, provider `auto` | prefetch, provider `nemar` | this branch |
|---|---|---|---|---|
| no subject field (nm000205 today) | `None` (manifest records no subjects) | whole tree, 14 files (warns "enriched before ... recorded subjects") | whole tree, 14 files | same (14 files) |
| `"subject": ["13","14"]` | `NemarDownloadError: lists no sourcedata for subject 13` | 0 files; warns and leaves the load to figshare | **raises** `NemarDownloadError` | 2 files |
| `"subject": null` + `"subjects": [...]` | same error (every entry is "shared", none is subject 13's) | 0 files; warns, figshare | **raises** `NemarDownloadError` | 2 files |
| `"subjects": [...]`, no `subject` key (**chosen**) | `None`, as today | whole tree, 14 files, as today | whole tree, 14 files, as today | **2 files** (`G7/G7D1.mat`, `G7/G7D2.mat`) |

All five releases and develop ed1aacdb3 give identical results.

No format makes a released version raise anything other than `NemarDownloadError`, so nothing crashes. But a list in `subject`, or `subject: null` on every entry, matches no subject in those releases: with `MOABB_DOWNLOAD_PROVIDER=nemar` the prefetch raises, and with `auto` it warns and goes back to figshare. Only `subjects` with no `subject` key keeps released versions doing what they do today (no subject recorded, so the whole tree is fetched). The deposit uses that format. This code also accepts a list in `subject`, for manifests written that way.

### Tests

`moabb/tests/test_nemar_multi_subject_files.py` (offline, 10 tests): pair files resolve for both members (scalar, string and alias-list subject ids); a list in `subject` matches too; multi-subject entries are not shared; unknown subjects still raise with the known labels; per-subject `nemar_sourcedata_is_local`; scalar manifests unchanged; `Zheng2020._seed_loader_cache(14)` links only `G7/G7D{1,2}.mat` and `data_path(14)` resolves with no download or socket. On origin/develop ed1aacdb3, 9 of the 10 tests fail (the scalar one passes). On the branch, all `test_nemar_*.py` and `test_download.py` pass (download-marked tests skipped).

NEMAR side: `nm000205` 1.0.4 -> 1.0.5 with `subjects` on all 14 entries is staged and validated (bids-validator 0 errors, `nemar dataset validate` OK) but not pushed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0944cbdf9cc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.