# Issue

**Title:** [GUI] Fix truncated Help, Cancel and OK buttons

## Description

The bottom buttons were sized in normalized units, so their pixel width followed the figure scaling factor and their labels were clipped in narrow dialogs (28 px wide buttons on a 3440 px display, 56 px on a 560 px default figure). They are now sized in pixels from the rendered label, and the figure is widened only when the row does not fit.

Checked on pop_resample and on the single help, double help, no help, wide, geomvert and geom layouts, plus a full pop_resample round trip on sample data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b0f012bd6fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.