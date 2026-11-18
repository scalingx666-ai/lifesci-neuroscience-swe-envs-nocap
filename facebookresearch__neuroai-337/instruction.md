# Issue

**Title:** neuralset: MEG head-frame positions, SSS and scaler statistics in the cache

## Description

Improves MEG support: sensor positions in the head frame, optional SSS and CTF gradient compensation, and scaler statistics stored in the cache so the filtered signal can be recovered. All `ChannelPositions` caches, EEG included, are recomputed (`infra.version` bumped to "1").

## MEG sensors in the head frame

- `MneTimedArray` caches the recording's `dev_head_t` (stored as `None` when absent, so older caches can be told apart) and `to_info()` restores it.
- `ChannelPositions` gains `coord_frame: Literal["head", "device"] = "head"`: MEG sensor positions are mapped from the device to the head frame with the cached `dev_head_t`. Recordings without `dev_head_t` warn and keep the device frame; MEG caches written before this change raise in the head frame. `infra.version` is bumped to `"1"`.
- `normalize` becomes a mode: `"min_max"` (default, formerly `True`) or `"center_and_scale"`.

## MEG preprocessing

- `MegExtractor.apply_sss` (`bool | "maxshield"`): bad-channel detection and Maxwell filtering on Elekta/MEGIN recordings not already filtered, using the BIDS calibration/cross-talk siblings when present.
- `MegExtractor.compensation_grade`: gradient compensation grade applied before channel selection on CTF recordings.

## Cache header

- `MneRaw`, `FnirsExtractor` and `SpikesExtractor` keep their scaler statistics in the cache header (`scaler_center`, `scaler_scale`, aligned with `ch_names`; `None` without a scaler), so `x = x_cached * scale + center` recovers the filtered signal.

## Fixes

- Audio extractors read silent videos as zeros instead of failing.
- `HuggingFaceImage` excludes `frequency` from its cache uid unless it extracts videos.
- Array-valued event cells: `Event.from_dict` skips its NaN check on them and `SegmentsMixin.events` deduplicates them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2537659142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.