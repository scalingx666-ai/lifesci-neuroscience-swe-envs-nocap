# Issue

**Title:** ENH add types and tests for quickflat

## Description

This PR adds type support for the non-SVG functions in `cortex.quickflat`, improves test coverage for the many unested arguments of `quickflat.make_figure`, and fixes a regression in `cortex.quickflat.composite.add_rois`.

The `shadow` kwarg of `add_rois` was deleted in 5d8311d8. This restores that functionality.

(This separates the quickflat-specific code out from #670 .)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1583a5daa3c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.