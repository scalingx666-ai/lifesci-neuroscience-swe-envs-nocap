# Issue

**Title:** Replace linear channel-name lookups with dictionaries

## Description

#### Reference issue (if any)

None. Found while profiling a read → pick → filter → epoch → average workflow.

#### What does this implement/fix?

Three places in `mne/_fiff` matched channel names by scanning a list, which is
quadratic in the channel count:

- `_make_projector()` called `col_names.index(name)` inside a loop over
  `ch_names`. A `set` was already used for the membership test, but the lookup
  next to it still scanned.
- `pick_channels()` did three list scans per included channel:
  `name in ch_names`, `name not in exclude`, and `ch_names.index(name)`.
- `_picks_str_to_idx()` called `info["ch_names"].index(pick)` once per pick.

Each becomes a single dict lookup. `ch_names` is already asserted unique in
`pick_channels`, and duplicate `col_names` already raise in `_make_projector`.
In `_picks_str_to_idx` the map is built with `setdefault`, so it keeps
`list.index()`'s first-match semantics exactly, even though ambiguous names are
rejected further down anyway.

Medians of 3 interleaved A/B rounds against a pristine `main` worktree:

| | 128 ch | 306 ch | 1000 ch |
|---|---|---|---|
| `pick_channels` | 2.1x | 3.6x | 10.2x |
| `_picks_to_idx` | 1.4x | 2.3x | 6.4x |
| `_make_projector` | 1.6x | 2.9x | 3.3x |

End to end, `apply_proj()` on a 392-channel raw goes 21.7 → 17.8 ms. The
speedup grows with channel count, so it matters most for whole-head MEG and
high-density EEG.

#### Correctness

- 24/24 projector matrices bit-identical to `main` across six real MEG files,
  with and without bad channels.
- 700 fuzzed `pick_channels` / `_picks_to_idx` cases identical, including
  duplicate names, absent names, `ordered=True/False`, and the exceptions
  raised.
- `pytest mne/_fiff mne/io mne/tests mne/preprocessing mne/channels`:
  3506 passed, 0 failed.

Two tests are added. They pin *name-based* mapping specifically: the projector
test uses `col_names` permuted relative to `ch_names`, so a positional match
annihilates the wrong direction and fails. Mutation-tested — substituting
position for name in either function is caught, as is dropping the `bads`
filter, ignoring `exclude`, and silently skipping missing names.

#### Additional information

AI disclosure: I directed the work and reviewed and tested everything; Claude
Code (Claude Opus 5) did the profiling that found these, made the edits, and
ran the A/B measurements and fuzzing under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71850f67d18f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.