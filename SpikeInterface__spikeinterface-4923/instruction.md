# Issue

**Title:** Fix binary save when only some segments have a time vector

## Description

Found while fixing #4914, listed under "Not addressed" in #4922.

`recording.save(format="binary", ...)` raised `FileNotFoundError` when only some segments have a time vector, for example after `recording.set_times(times, segment_index=0)`. `write_recording` listed a timestamps file for every segment, but only those with a time vector are written. The error came after all the traces were written.

This PR lists `None` for the segments without a time vector, and makes `BinaryRecordingExtractor` and `recursive_path_modifier` accept these entries. It also includes the `t_starts` lines of #4922, so that a time vector on one segment and a `t_start` on another works without depending on it. The two PRs merge without conflict in either order, and these lines drop out of this diff if #4922 goes in first.

`binary.json` can now contain `null` in `file_timestamps_paths`. Older versions cannot load these folders, but could not create them either, and the output is unchanged when no segment or every segment has a time vector. I also considered ignoring a missing timestamps file when loading, but a lost file would then silently reset the times to 0.

Claude helped me with this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21f7fcbbba24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.