# Issue

**Title:** Take archive members from the NEMAR store before downloading the archive (BI2012-BI2015b, BNCI2019_001, BNCI2025_001, Hinss2021)

## Description

NEMAR deposits mirror what an archive extracts to, not the archive itself. Several loaders call `data_dl()` for the `.zip` *before* checking whether the extracted files are already there. The URL lookup in `data_dl` cannot match an archive that the store does not hold, so with the default `"auto"` provider they fetch the whole archive from the upstream host, even though `get_data()` has just prefetched its contents from NEMAR.

Found by an audit of every dataset with a `nemar_id` (Voyager, first subject, empty cache, every HTTP request logged). On develop:

| Dataset | deposit | fetched upstream after the NEMAR prefetch |
|---|---|---|
| BI2012 | nm000260 | zenodo `subject_01.zip` (28.7 MB) |
| BI2014a | nm000244 | zenodo `subject_01.zip` |
| BI2014b | nm000215 | zenodo `group_01_mat.zip` |
| BI2015a | nm000216 | zenodo `subject_01_mat.zip` |
| BI2015b | nm000217 | zenodo `group_01_mat.zip` |
| BNCI2019_001 | nm000149 | `bnci-horizon-2020.eu` / `lampx.tugraz.at` `P01.zip` |
| BNCI2025_001 | nm000162 | `lampx.tugraz.at` `p001.zip` |
| Hinss2021 | nm000343 | zenodo `P01.zip` (the silent fallback noted after the nm000343 re-release) |

### Change
- `download.data_dl_destination(url, sign, path=None, fname=None)` returns where `data_dl` would store `url`, without any network access. A test checks it against `data_dl` for a zenodo URL, a plain URL and an explicit `fname`.
- `download.fill_from_store(base_dir, files)` links the archive members a loader reads from the active NEMAR store, using each file's path relative to the archive's extraction directory. It is all or nothing: it links only when the store or the cache holds every member, so a partial deposit never leaves a half-extracted tree. Since nothing gets linked in that case, an archive extracted afterwards can never write through a link into the store.
- The eight loaders compute the members they read, ask `fill_from_store` first, and download and extract the archive only when it returns False. The folder computations after the download are unchanged, including BI2015a's `str.strip` path, under which `nm000216` really stores its files: `subject_01_masubject_01/`.
- BNCI2025_001 requires the `.fdt` as well. `nm000162` mirrors only the `.set`, so this loader keeps downloading the ZIP until the deposit is completed (NEMAR side).

### Verification (Voyager, this branch alone on develop)
| Dataset | develop: class, upstream hosts | this branch: class | sessions/runs develop -> branch |
|---|---|---|---|
| BI2012 | nemar+upstream (zenodo.org) | nemar_only | 1/1 -> 1/1 |
| BI2014a | nemar+upstream (zenodo.org) | nemar_only | 1/1 -> 1/1 |
| BI2014b | nemar+upstream (zenodo.org) | nemar_only | 1/1 -> 1/1 |
| BI2015a | nemar+upstream (zenodo.org) | nemar_only | 3/3 -> 3/3 |
| BI2015b | nemar+upstream (zenodo.org) | nemar_only | 1/4 -> 1/4 |
| BNCI2019_001 | nemar+upstream (bnci-horizon-2020.eu, lampx.tugraz.at) | nemar_only | 1/9 -> 1/9 |
| BNCI2025_001 | nemar+upstream (lampx.tugraz.at) | nemar+upstream | 1/1 -> 1/1 |
| Hinss2021 | nemar+upstream (zenodo.org) | nemar_only | 2/2 -> 2/2 |

### Tests
`moabb/tests/test_nemar_archive_members.py` (offline, 15 tests):
- each of the 8 loaders with `data_dl` and sockets forbidden, using member paths copied from the real deposits. All 8 fail without the loader change.
- the all-or-nothing fallback
- no active store, and paths outside `base_dir`
- `data_dl_destination` matches `data_dl`

`test_dataset_fixes.py` (18) and `test_hinss2021_alignment.py` still pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6f81389d584`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.