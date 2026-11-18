# Issue

**Title:** Fix CurationV1.get_recording to trigger recompute when file is missing

## Description

`CurationV1.get_recording` reimplemented recording retrieval inline without checking file existence, so it would raise an error instead of triggering recompute when the analysis NWB file was absent. `SpikeSortingRecording.get_recording` already handles this correctly via `_make_file`. Additionally, `SpikeSortingRecording.get_recording` was missing the `is_filtered=True` annotation needed by spikeinterface's `WaveformExtractor`.

# Description

- `src/spyglass/spikesorting/v1/curation.py`: Replace inline NWB read logic in `CurationV1.get_recording` with a direct delegation to `SpikeSortingRecording.get_recording`, which checks file existence and recomputes if missing.
- `src/spyglass/spikesorting/v1/recording.py`: Add `recording.annotate(is_filtered=True)` to `SpikeSortingRecording.get_recording`, since recordings stored in that table are always pre-filtered. This is required by spikeinterface's `WaveformExtractor` and was previously only present in `CurationV1.get_recording`.

**Before (`CurationV1.get_recording`):**
```python
# fetched file name, resolved path, read NWB — no existence check, no recompute
analysis_file_name = (SpikeSortingRecording * SpikeSortingSelection & key).fetch1("analysis_file_name")
analysis_file_abs_path = AnalysisNwbfile.get_abs_path(analysis_file_name)
recording = se.read_nwb_recording(analysis_file_abs_path, load_time_vector=True)
recording.annotate(is_filtered=True)
return recording
```

**After (`CurationV1.get_recording`):**
```python
recording_key = (SpikeSortingRecording * SpikeSortingSelection & key).fetch1("KEY")
return SpikeSortingRecording.get_recording(recording_key)
```

**After (`SpikeSortingRecording.get_recording`):**
```python
recording = se.read_nwb_recording(analysis_file_abs_path, load_time_vector=True)
recording.annotate(is_filtered=True)  # added — recordings here are always pre-filtered
return recording
```

# Checklist:

- [x] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [x] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1fe0cfca511`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.