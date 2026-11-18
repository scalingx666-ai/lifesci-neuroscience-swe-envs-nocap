# Issue

**Title:** test(nemar): wire Vagaja2023 nemar_id=nm000292, drop from NEMAR_ID_PENDING

## Description

## Summary

Set `nemar_id = "nm000292"` on `Vagaja2023` and drop it from `NEMAR_ID_PENDING`
in `moabb/tests/test_datasets.py` (same pattern as #1223). nm000292 was
published on NEMAR on 2026-10-05.

**No loader scientific change.** Test-only + one class attribute.
No changelog entry (please apply the `no changelog` label).

## Evidence

Reader-proof run as a k8s Job on Voyager, `origin/develop` HEAD `3888687e0`,
`MOABB_DOWNLOAD_PROVIDER` pinned to `nemar` (no upstream fallback allowed by
that pin -- see `download()`/`_prefetch_nemar_sourcedata()` in
`moabb/datasets/base.py`), against the **published** deposit nm000292:

- `nemar.download()`-based BIDS fetch (`_download_nemar(subject=3)`, the same
  call `sourcedata_path`/`get_data` route through) succeeded, genuinely
  reaching `data.nemar.org` (15 files fetched, no upstream host contacted).
- `Vagaja2023().sourcedata_path(subject=3)` fails right now with
  `NemarDownloadError` from `_sourcedata_files_for_subject`
  (`moabb/datasets/download.py:436`) -- traced to NEMAR's own BIDS query
  layer returning `SelectionError: No files matched the BIDS query:
  scope=sourcedata`, reproduced even with a subject-agnostic, no-filter
  `nemar.download(dataset="nm000292", scope="sourcedata")`. This is **not**
  a subject-match bug or a pending PR: `sourcedata/` is already committed to
  `nemarDatasets/nm000292`'s `main` branch (commit `caf4a627`, "Add
  sourcedata (original files) with provenance manifest", 2026-10-05 21:44
  UTC; `sourcedata_provenance.json` confirmed as a plain git blob, mode
  `100644`) and there is no open PR on that repo (`main`, `git-annex`,
  `synced/git-annex` only) -- NEMAR's served index for the dataset simply
  has not picked up that commit yet. `get_data()` depends on the sourcedata
  mirror for this (non-BIDS-native) loader, so it does not yet succeed
  through NEMAR either, for the same underlying reason.

Control (published, already-wired `Pressel2016`/nm000258, same Job, same
strict provider pin): both `get_data(subjects=[1])` and
`sourcedata_path(subject=1)` **passed** -- 1 session/1 run, shape
`[7, 2483088]`; sourcedata 1 file, 130,783,392 bytes, sha256 matched against
the deposit's own manifest.

Full report with exact commands, logs and JSON results:
`.pr-audits/w41/N5B-REPORT.md` (not committed to this PR; internal tracking).

## Tests

```
PYTHONPATH=$PWD .venv/bin/python -m pytest moabb/tests/test_datasets.py \
    ::Test_Datasets::test_all_datasets_have_valid_nemar_id \
    ::Test_Datasets::test_nemar_id_class_attributes \
    --basetemp=/tmp/n5b-pt -p no:cacheprovider
→ exit=0 (167 passed, 39 skipped: pending publication / exempt)

PYTHONPATH=$PWD .venv/bin/python -m pytest moabb/tests/test_archive_c_regression.py \
    -k Vagaja --basetemp=/tmp/n5b-pt2 -p no:cacheprovider
→ exit=0 (3 passed)

pre-commit run --files moabb/datasets/vagaja2023.py moabb/tests/test_datasets.py
→ rc=0 (all hooks Passed, non-applicable hooks Skipped)
```

## Not merging

Per the parent task's contract, this PR is opened for review only; the
parent merges on green. `sourcedata_path`/`get_data` through NEMAR for this
dataset will start passing once NEMAR's index catches up with the already
-committed `sourcedata/` tree -- no further MOABB-side change is expected to
be needed for that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3888687e0781`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.