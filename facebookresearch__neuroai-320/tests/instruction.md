# Issue

**Title:** Fix ExtractAudioFromVideo for Video events covering part of a file

## Description

`ExtractAudioFromVideo` produced wrong Audio events when a Video event covered only part of its file (e.g. several playback spans of one movie):

1. The wav path is per video file (`movie.mp4` → `movie.wav`), but its content came from a single event: `Video.read()` returns only that event's `[offset, offset + duration]` subclip. So `movie.wav` held only the **first processed span**, and later events of the same file reused it: wrong audio (the wav starts at the first span's offset) or none at all (past the first span's length).
2. Audio events were created with `frequency=pd.NA`, so `Audio.model_post_init` re-read the wav and **overwrote each event's duration** with the wav length.

**Fix**
- Write one wav per video file from the file's whole audio track.
- Set the Audio `frequency` from the wav, so each Audio event keeps its Video event's `start`, `offset` and `duration`.
- Write the wav through `exca.utils.temporary_save_path` (a failed write can't leave a partial wav for later runs) and always close the video clip.

**Test**: `test_audio.py` builds two partial Video events of one 6 s file, the first starting at offset 2 s. On `main`, the wav is 2 s long instead of 6 s.

**Why one wav per file rather than per event**
- Audio events mirror their Video events (same `offset` / `duration` into the file), so downstream transforms such as `ChunkEvents` treat both modalities the same way.
- Keeps the existing `<video>.wav` convention: correct wavs extracted from full-file Video events are reused as is.
- Per-span wavs would need the span in the filename, multiply files, duplicate overlapping spans, and orphan files when span boundaries change.
- Cost: the whole audio track is extracted even if events cover only part of the file.

**If you used this transform on partial Video events**
- Truncated wavs already on disk are reused: delete them, or run once with `overwrite=True`.
- Cached outputs of this transform and later steps keep the wrong events, and the fix doesn't change their cache uid: clear them, or rerun once with `infra.mode="force"`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b924a95c3efe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.