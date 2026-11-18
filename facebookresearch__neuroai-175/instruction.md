# Issue

**Title:** Fix Brennan2019Hierarchical loading for the v2 (`bn999738r`) release

## Description

`Brennan2019Hierarchical` targeted the v2 Deep Blue record but the reader still assumed the v1 layout and channel naming, so `study.run()` failed on a fresh download. #172 reports the `len(meta) != 2129` crash — it's the deepest of four migration breakages, three of which block loading before you reach it. Fixes:

1. **`_download`** now extracts `proc.zip` (the `timelock-preprocessing/*.mat` files) in addition to `audio.zip`, skipping `__MACOSX` entries. The extract-success marker is bumped to `success_extract_v2` so existing caches re-extract — they'd otherwise keep the old marker and never pick up the `.mat` files.
2. **`iter_timelines`** now excludes the 6 in-range subjects with no `.mat` (`S28, S29, S31, S33, S46, S47`) alongside the 9 incomplete-trial subjects (1973–1987 trials vs 2129 — the existing `# FIXME … bad trl?` set), yielding the 33 already declared by `_info`/docstring.
3. **`_load_raw`** types any channel absent from the `easycap-M10` montage (`EOG`→eog, else misc) before `set_montage`, handling v2's `AUD` (a few subjects keep `Aux5`). The channel assertion changes from "62 total" to "60 scalp EEG" (matches `data_shape`), since the aux name/count varies per subject.

This 's crash by excluding the incomplete subjects (the drop path — matching the paper's 33-subject cohort), rather than recovering them via a fixed alignment for the `meta.join(story)` index join. That recovery is a separate, larger decision — see the #172 discussion.

Adds a dataset-free regression test pinning `len(iter_timelines()) == 33`.

## Verification

`study.run()` loads all 33 subjects; `compute_study_info` matches `_info` exactly (33 timelines/subjects, 2226 events, `data_shape=(60, 366525)`, 500 Hz). `ruff check`/`ruff format` and `pytest neuralfetch/test_studies.py` are green locally.

## Notes for review

I worked through this independently from the tutorials — debugging down the stack to all four breakages — and only found #172 and @hubertjb's comment when raising this PR. @hubertjb, since you flagged taking it this week, it's entirely yours to take over, modify, or close; I'm opening it in case it saves the time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb7888d6a69e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.