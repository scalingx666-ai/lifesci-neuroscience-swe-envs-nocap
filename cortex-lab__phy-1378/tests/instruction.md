# Issue

**Title:** Fix blank numpy-typed columns in native Qt ClusterView

## Description

phy 2.1.0rc1's rewritten native-Qt ClusterView (release-2.1) renders the numpy-typed columns (id / sh / depth / amp) as BLANK cells, while the native-Python columns (ch / fr / n_spikes / Amplitude) display fine.

Cause: `_TableModel.data()` returns numpy scalars (np.int64 / np.float64) to Qt's model/view, which cannot display them and shows empty cells.

Fix: convert numpy scalars to native Python via `.item()` in `data()`. The `hasattr(value, 'item')` guard means native-Python values (which lack `.item()`) pass through unchanged, so only the affected numpy columns are touched.

Tested on phy 2.1.0rc1 with a KiloSort4 sort: id/sh/depth/amp now display correctly and the previously-working columns are unaffected.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ea618880727`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.