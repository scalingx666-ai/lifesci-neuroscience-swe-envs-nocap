# Issue

**Title:** Huebner2017/2018, Liu2024, Sosulski2019: use the extracted files before downloading the archive

## Description

NEMAR deposits keep what an archive extracts to, not the archive. Four loaders still called `data_dl` on the archive before looking for the extracted files, so with the default provider they downloaded it from upstream even though NEMAR (or an earlier extraction) already held every file they read:

| loader | archive | deposit |
|---|---|---|
| Huebner2017 / Huebner2018 | Zenodo `subjectXX.zip` | nm000199 / nm000195 (`subjectXX/`) |
| Liu2024 | figshare `edffile.zip` | nm000158 (`sub-XX/eeg/*.edf`) |
| Sosulski2019 | FreiDok archive (2.6 GB) | nm000266 (`subjectN/`) |

This reuses #1287's `data_dl_destination` / `fill_from_store`. It also adds `download.fill_tree_from_store(base_dir, member_dir)` for loaders that read a whole extracted directory: all or nothing, and it refuses a directory whose BrainVision/EEGLAB/Curry headers name files the store lacks (the header-only deposits we had before today's NEMAR releases).

- Huebner, Sosulski2019: store, then an earlier extraction, then the archive.
- Liu2024: `fill_from_store` of the subject's EDF first. Extraction now writes only the members not on disk yet, so a later extraction never writes through the hard links into the store.
- Sosulski2019: the outer archive is extracted again when the subject's inner ZIP is missing, no longer only when `extracted/` is absent (subjects taken from the store create `extracted/`).

Tests (`test_nemar_archive_members.py`): Huebner2017/2018, Liu2024 and Sosulski2019 load from a synthetic store with sockets and `data_dl` forbidden (these fail on develop), a header-only store still downloads the ZIP, an existing extraction is reused without the ZIP, and Liu2024 does not overwrite store links.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e3b1d9ed798`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.