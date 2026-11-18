# Issue

**Title:** neuralfetch: add utils.textgrid and read LPPC TextGrids through it

## Description

Adds `neuralfetch.utils.textgrid.read_tiers_lenient`, a lenient counterpart to `praatio.openTextgrid`.

It wraps praatio rather than replacing it: standard (normal/short) grids are read through the lower-level `praatio.utilities.textgrid_io.parseTextgridStr`, which skips the `IntervalTier` validation that rejects the ~1e-4 s floating-point boundary overlaps Praat exports carry. Only Praat's *chronological* format — which praatio cannot parse in any form — has a parser of its own here. Tiers come back as `[(tier_name, [(start, end, label), ...]), ...]` with labels stripped.

`Li2022Petit` now reads through it, which subsumes the explicit label strip from #271.

`praatio` stays an opt-in extra — it is imported inside `read_tiers_lenient`, so importing the module never requires it and the chronological path does not need it at all. For the same reason this is not re-exported from `neuralfetch.utils` (matching `bids` / `runner`).

It is also added as a `dev` extra, which CI now installs. That runs the new tests and unskips the existing `Li2022Petit` / `Li2022PetitSample` study tests, which were silently skipping for lack of `praatio`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22edc34b62de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.