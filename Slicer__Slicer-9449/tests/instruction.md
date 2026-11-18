# Issue

**Title:** BUG: Bound segmentation effect brush diameter with range

## Description

When the Shift + Mouse wheel is used to change the size of the brush diameter (Paint, Erase, Smooth), the slider and spin-box values are synchronized with it, until we reach a bound. Then the brush still changes instead of being blocked.
This PR bounds the change to the range.

The relative range is a fixed percentage-of-screen scale, not a physical quantity that varies per application, so the relative bounds are not matched with BrushMinimumRelativeDiameter / BrushMaximumRelativeDiameter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.