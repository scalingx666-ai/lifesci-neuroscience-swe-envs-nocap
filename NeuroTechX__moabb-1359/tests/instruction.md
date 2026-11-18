# Issue

**Title:** fix(docs,datasets): prefetch CompoundDataset NEMAR data and harden docs MNE cache

## Description

## Summary
- Add `CompoundDataset._prefetch_nemar_sourcedata` and invoke `_prefetch_nemar_sourcedata` unconditionally in `BaseDataset.get_data` so compound datasets prefetch inner datasets' NEMAR `sourcedata/` in the parent process before spawning parallel workers.
- Update `.github/workflows/docs.yml` to pre-download all subjects required by `tutorial_5_combining_datasets.py` (`Cattan2019_VR` subjects `[1, 2]`, `BI2014a` subjects `[4, 7]`, `Cattan2019_PHMD` subject `1`), pre-populate synthetic `ExampleDataset` `.mat` files for `tutorial_4_adding_a_dataset.py`, remove the 60s Zenodo rate-limit sleep between NEMAR S3 downloads, clean `mne_data/results`, and bump the MNE data cache key to `v4` (restoring from `v3`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d93c0cc0859`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.