# Issue

**Title:** Accept recording= consistently in detect_and_remove_bad_channels, depth_order and average_across_direction

## Description

`detect_and_remove_bad_channels(recording=rec)` — the example in `doc/modules/preprocessing.rst` — raises `TypeError: DetectAndRemoveBadChannelsRecording.__init__() missing 1 required positional argument: 'parent_recording'`. Same for `depth_order` and `average_across_direction`, different message. All three work fine called positionally, probably why this went unnoticed.

Cause: these three classes name their first `__init__` argument `parent_recording`, while every other preprocessing class (and the dispatcher that builds the public function, `core_tools.py`) expects `recording`.

Fix: rename to `recording` in all three, matching the rest of the module. `parent_recording` stays accepted permanently, not deprecated — it's the literal key `ChannelSliceRecording` (and these classes) already use to serialize `_kwargs`, so recordings saved by older versions still reload with `parent_recording=`. Put the alias in the `__init__`s rather than `from_dict` or the dispatcher so direct construction keeps working too, not just deserialisation — happy to move it if you'd rather handle it differently.

Added a `recording=` test per function plus one for the resolver helper (fail on `main`, pass with the patch), and a `from_dict` round-trip test per function using the legacy name (passes on `main` too, by design — shows the fix doesn't break loading old recordings). Local preprocessing suite: 268 passed, no regressions.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af342e6e2ea6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.