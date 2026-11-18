# Issue

**Title:** Detection module refactor: stats.py

## Description

Hi,

This pull request splits out the algorithmic and data aggregation steps in stats.py, making the code more testable while still user-friendly.  The major feature addition here is the ROI dataclass, a frozen class which does data validation on ypix, xpix, and lam and provides handles to the main roi calculation operations, using cached properties to reduce recomputation time on the most heavy and repeated operations.

The compilation of the stats array of dicts is moved out of stats.py and into detect.select_rois() to increase transparency and make optimization simpler.  Further refactoring is needed for seperating out the behaviors of sparsery(), sourcery(), and select_rois().

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d3d020c9ab0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.