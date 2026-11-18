# Issue

**Title:** neuralfetch: move the BIDS exporter to `utils.bids.export` and fix stimulus/fNIRS export

## Description

Moves the BIDS exporter (`BidsExporter`, `study_to_bids`) from the `neuralfetch.utils.bids` module to `neuralfetch.utils.bids.export`, making `utils.bids` a package. The `export-bids` CLI command is unchanged; its imports, the tests, and the API reference are updated.

Also fixes the exporter:

- **Audio stimuli were never exported.** `STIMULUS_FILE_TYPES` listed `Sound`, but the neuralset event type is `Audio`.
- **Timelines could overwrite each other.** The BIDS path used only subject, session, task and run, so timelines told apart by another field (e.g. `Liu2024Eeg2video`'s seven `block` timelines per session) all mapped to one file. Colliding timelines are now numbered as distinct runs, skipping runs already in use, with a warning.
- **`stim_file` pointed to `stimuli/stimuli/...`.** BIDS defines `stim_file` relative to the `stimuli/` directory, so the `stimuli/` prefix is dropped.
- **Stimulus files sharing a basename overwrote each other.** Everything was flattened to `stimuli/<basename>`, and the first copy won. Paths are now kept relative to the deepest folder shared by all of the study's stimuli, so a flat stimulus folder still exports to `stimuli/<name>`. `overwrite=True` now re-copies stimuli.
- **fNIRS export always failed.** `Fnirs` passed device validation, but mne_bids can only write NIRS by copying a source SNIRF file, not from the preloaded raws the exporter writes. It is removed from the supported devices and the CLI's `--device` choices.
- `subject_info` is set with a plain dict instead of the private `mne._fiff.meas_info.SubjectInfo`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edba671d86cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.