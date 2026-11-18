# Issue

**Title:** DOT additions

## Description

Hello all,

This PR includes code that begins to properly integrate DOT processing into aa. The changes are mostly making streams renameable so existing modules that work with epi data can be used with DOT data. This is a long-term project; more modules will be modified as we eventually open more aa functionality to DOT. If you're not working with DOT, these changes should be transparent.

There's also aamod_dot_fromnifti that creates a bona fide "dot" stream rather than repurposing "epi" (hence the need for the renameable streams mentioned above) which is how we were previously working with DOT data. Future PR will add aamod_dot_fromsnirf, aamod_dot_fromndot, and so on as time permits.

Also included is a new lightweight QA module that generates a combined carpet, joy, and outlier plot for functional data along with a summary of basic file metrics (dimensions, voxel size, number of NaN, etc). It will work on any 4D data, has no prerequisite streams (the current carpet plot module needs FD and DVARS and segmentation) and saves jpegs that can be loaded using aa_jpeg_crawler and visually reviewed. We have discovered the joy plots are good for our DOT data, which often contain artifacts that are hard to see in a carpet plot.

Finally, aamod_intersubject_correlation has been modified to optionally exclude outliers. These can artificially inflate r values if not removed



![sub-23-ses-01-task-movie-bold](https://github.com/automaticanalysis/automaticanalysis/assets/25826038/890f8b76-17ee-4975-b701-2389ec6c2dd2)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1796d20a222`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.