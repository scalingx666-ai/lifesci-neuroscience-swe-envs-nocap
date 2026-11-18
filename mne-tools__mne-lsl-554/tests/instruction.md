# Issue

**Title:** Add alternative to stream annotations on a single string typed channel

## Description

Changes:
 - ` src/mne_lsl/player/player_lsl.py`: 
     - Added `annotations_encoding: Literal["one-hot", "string"] = "one-hot"` parameter to `__init__`
     - Branched _stream_annotations to push one-hot or string data based on the flag
     - Updated the docstring to document both modes
 -  `tests/player/test_player_lsl.py`:
     -  Added `test_player_annotations_string_encoding` for the new string mode
 -  `tests/stream/test_stream_lsl.py`:
     -  Added annotations_encoding parameter to _player_mock_lsl_stream_annotations
     -  Added mock_lsl_stream_annotations_string fixture (uses annotations_encoding="string")
     - Updated test_stream_annotations_string_dtype to use the new string version

If this is merged than #550 can be ignored and closed - this is a replacement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3364a7f530a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.