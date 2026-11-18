# Issue

**Title:** Fix Lenaig2026 data_path layout + Schrag2026Pediatric zero-annotation run crash

## Description

## Problem

Both bugs were found re-running the Voyager convert pipeline on real downloads (not caught by synthetic tests, since neither reproduces the real archive layout / real-subject trial-CSV drift). See `.pr-audits/w41/V6B-REPORT.md` for the original evidence.

### 1. Lenaig2026
`data_path()` hard-coded an `EEG_24Chan_AudioStim/` wrapper directory for the extracted RAR. The current Zenodo v2 archive (record 21156618) extracts `EXP1/`/`EXP2/` directly at the extraction root, so every subject's `data_path()` raised `FileNotFoundError: Some data files are missing.` before ever reading a file.

**Fix:** locate each run's file with a recursive glob (`base_path.glob(f"**/{rel}")`) that matches both the wrapped and flat layouts, instead of a single hard-coded relative path. Events/labels are unchanged.

### 2. Schrag2026Pediatric
`_load_game_run`'s documented policy drops all trial labels when a game run's `Trial Started` marker count drifts more than 10% from its movements-CSV row count. Subject 1's personalized-stimulus game run (`task-T3_acq-C3S1_M2`) has 15% drift, so that run ends up with zero annotations. `_get_single_subject_data` returned it anyway, and `bids_interface._write_file` hard-requires every `Raw` to carry annotations, so the whole convert crashed with `ValueError: Raw object must have annotations to be saved in BIDS format.`

**Fix:** `_get_single_subject_data` now skips a run that ends up with zero events instead of returning it, logging a warning that names the subject and run. The class and `_load_game_run` docstrings document this. The high-drift policy itself (why labels are dropped) is unchanged — this only changes what happens to a run with zero resulting labels.

## Tests
Two new regression tests in `moabb/tests/test_dataset_fixes.py`:
- `test_lenaig2026_data_path_accepts_wrapped_and_flat_layouts`: a synthetic tmp tree in each layout, asserting `data_path()` finds the right files either way.
- `test_schrag2026_skips_run_with_zero_annotations_after_high_drift`: mocks `_load_game_run` to return one zero-annotation and one labelled run, asserts the zero-annotation run is skipped and a warning names the subject/run.

Both pass locally (`pytest -k "lenaig2026 or schrag2026"`), plus the rest of `test_dataset_fixes.py` (15/15 passed).

## Not in scope
Does not touch the Lenaig2026 CC-BY-NC-ND-4.0 licence question (held for a separate confirmation) or attempt any upload/publish.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `448087262419`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.