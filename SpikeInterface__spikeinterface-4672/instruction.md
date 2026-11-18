# Issue

**Title:** Recover `main_channel_indices` from templates for recordingless analyzers

## Description

The backwards-compatibility path that reconstructs `main_channel_indices` computes them from the `templates` extension, which the method documents as the first-priority source, but it never returned that value. For a dense analyzer with no attached recording the computed result was discarded and execution fell through to a `raise`, so `unit_locations` (and anything else that needs main channels) could not be computed even though the templates were present. For a sparse analyzer the templates result was then overwritten by the geometric-centroid fallback, silently returning a less accurate main channel. This happens on any analyzer loaded without its recording, since `main_channel_indices` are only persisted as the `main_channel_id` sorting property and the fast path that reads them back needs a recording to map ids to indices.

The fix returns the templates-derived value as soon as it is computed, making templates authoritative as documented and resolving both the dense crash and the sparse silent regression with a single change. The two added tests rename channels to letters so that a channel id is unmistakably distinct from its positional index, and assert both the index and id returns of `get_main_channels`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e558a536898`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.