# Issue

**Title:** fix(bids): read and write BIDS JSON sidecars as UTF-8

## Description

#1059 made some of the `bids_interface` writes UTF-8, but the JSON sidecars were still opened with the locale encoding. `mne_bids` writes them as UTF-8 with `ensure_ascii=False`, so on Windows the read-modify-write in `_update_dataset_description_extra` turned `Müller-Putz` into `MÃ¼ller-Putz`, and a name like `Łukasz` raised `UnicodeDecodeError`.

This adds `encoding="utf-8"` to every JSON sidecar `open()` in `bids_interface.py` (participants, events, dataset description, channel-count fix, coordsystem, scans, channels) and to the electrodes TSV write, which is already read back as `utf-8-sig`. There's a new test in `TestUpdateDatasetDescriptionExtra` that writes the description the way `mne_bids` does and checks the authors after the update, plus a `whats_new.rst` entry.

Testing, on Windows 11 / Python 3.13 with locale cp1254: the new test fails on `develop` with `UnicodeDecodeError` and passes with the fix. `test_bids_enrichment.py`, `test_metadata.py`, `test_loader_utils.py`, `test_dataset_fixes.py` and `test_import_side_effects.py` give 617 passed (`-m "not network and not download and not slow"`; I didn't run the dataset-download tests). `ruff check`, `ruff format --check` (0.15.20, the pre-commit pin) and codespell are clean on the changed files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e55f0882b9ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.