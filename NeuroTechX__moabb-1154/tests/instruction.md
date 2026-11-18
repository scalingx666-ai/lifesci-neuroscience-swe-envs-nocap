# Issue

**Title:** Point Schrag2026Pediatric at Zenodo v3.0 and correct its licence

## Description

## The licence was wrong, and it mattered

`Schrag2026Pediatric` pinned Zenodo version 1.0, which registers **CC-BY-ND-4.0**. The module already carried a comment noting the conflict:

```python
# Zenodo deposit registers cc-by-nd-4.0; the preprint PDF says
# CC-BY-4.0. Zenodo metadata is authoritative for the data.
license="CC-BY-ND-4.0",
```

The authors have since resolved it: **version 3.0 (2026-06-25) registers `CC-BY-4.0`** on Zenodo. So the `NoDerivatives` term MOABB reports no longer applies — which is not cosmetic, since ND forbids distributing any derived form of the data.

## Smaller downloads, too

Version 3.0 publishes **one archive per subject** instead of the single ~1.2 GB `DatasetData.zip` that held all 47. Loading one subject now fetches ~20–40 MB. Because the Zenodo download URL ends in `/content`, the archive is named through `data_dl`'s `fname` argument rather than being derived from the URL.

## Verification

Live on subject 33, clean cache, `provider="upstream"`:

- fetched **35 MB** (`P033.zip`), not 1.2 GB
- both game runs load: `0standard` `(16, 242688)`, `1personal` `(16, 133248)`
- only `zenodo.org` contacted
- `pytest moabb/tests/test_metadata.py moabb/tests/test_datasets.py -k "not doi"` → **1514 passed**
- `ruff check` / `format` clean

## Note on the stale in-archive licence

The `dataset_description.json` *inside* the v3.0 archive still carries the superseded `CC-BY-ND-4.0` string and the older concept DOI — the authors updated the Zenodo record but not that file. The Zenodo record is authoritative; this is recorded in a code comment so the next reader does not "correct" it back.

## Follow-up (deliberately not in this PR)

A BIDS conversion of these recordings has been deposited on NEMAR as `nm000280`, so this dataset will gain a `nemar_id`. That is held back until the deposit has a released version — today the NEMAR index returns `latest=null` for it, so declaring `nemar_id` now would make the default `"auto"` provider warn and fall back on every load.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77af7c75c2fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.