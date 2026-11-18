# Issue

**Title:** Speed up find_matching_paths without changing which files match

## Description

#### What does this implement/fix?

Two behaviour-preserving speedups on the `find_matching_paths` path. Neither
changes which files match.

Stage profile on a synthetic 100-subject x 2-session x 4-run tree (4802 files),
`find_matching_paths(root, datatypes="eeg", extensions=".vhdr")`, medians of 5:

| stage | before | after | |
|---|---|---|---|
| `_return_root_paths` | 42.4 ms | 43.0 ms | 0.99x |
| `_filter_fnames` | 30.2 ms | 1.6 ms | **19.3x** |
| `_fnames_to_bidspaths` | 45.4 ms | 40.2 ms | 1.13x |
| **total** | **117.9 ms** | **84.8 ms** | **1.39x** |

End to end:

| operation | before | after | |
|---|---|---|---|
| `find_matching_paths` (with extension) | 126.1 ms | 84.7 ms | **1.49x** |
| `find_matching_paths` (no extension) | 351.6 ms | 312.4 ms | 1.13x |
| `BIDSPath.basename` | — | — | **2.55x** |
| `BIDSPath(**entities)` | 15.1 us | 13.7 us | 1.10x |

---

#### 1. Invert the entity shorthand map once (`basename`)

`BIDSPath.basename` rebuilt the long-to-short entity mapping **inside its own
loop**, so an 11-entry dict was inverted once per entity, on every access — and
`ALLOWED_PATH_ENTITIES_SHORT` is a module constant, so the result never changes.

`basename` is built for every `BIDSPath`, and `BIDSPath` construction is 49% of
`get_bids_path_from_fname`, which `find_matching_paths` calls once per file.

#### 2. Reject non-matching extensions before the regexp

`_filter_fnames` spends essentially all its time in the regexp — matching is
30.2 ms, the sort that follows is 0.09 ms. The pattern starts with `.*\/?` and
is applied to **full paths**, so for every candidate the engine walks the whole
directory prefix looking for somewhere `sub-` can start.

The regexp ends with the extension alternatives followed by `$`, so every name
it can match ends with one of their **literal tails** — for `.vhdr` that is
`vhdr`, since the leading `.` is a metacharacter matching any single character.
Testing that with `str.endswith` first can only reject names the regexp would
reject too.

`_literal_suffix` takes the longest trailing run with no regexp meaning, so it
stays conservative when an extension contains metacharacters (`.nii.gz` gives
`gz`) and does nothing when an alternative has no literal tail at all.

**Equivalence was fuzzed**, not just argued: 78 parameter combinations x 534
filenames, including names the current regexp matches but a naive
`endswith(".vhdr")` would not — e.g. `sub-01_task-rest_eegXvhdr`, where the `.`
matches `X`. **0 mismatches.**

#### What this deliberately does NOT do

I looked at making the leading `.*` stricter, which is worth another 2.2–5.8x:

| candidate | speedup | matches `xsub-01_...vhdr`? | matches `deriv_sub-01_...vhdr`? |
|---|---|---|---|
| current | — | yes | yes |
| match basename only | 5.8x | no | no |
| `(?:.*/)?` | 2.2x | no | no |

Both are stricter than today, because `\/?` makes the separator optional and
lets `.*` start matching mid-basename. That is arguably a bug against the
pattern's own comment ("nothing or something ending with a `/`"), but it changes
which files are found and datasets may rely on it, so I left the regexp alone.
Happy to open that separately if you think the stricter behaviour is correct.

#### Testing

- Full suite: **16 failures before and after, identical set** (missing datasets
  and BTi fixtures in my environment — I diffed the failure lists rather than
  comparing counts).
- `mne_bids/tests/test_path.py`: **100 passed**.

#### Additional information

AI disclosure: I directed the work and reviewed and tested every change; Claude
Code (Claude Opus 5) profiled the path machinery, ran the equivalence fuzzing
and the A/B measurements, and made the edits under my direction.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25f78ddf4318`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.