# Issue

**Title:** Minor synapse overlay features

## Description

Some minor changes towards enabling HDF5 label stack viewing.

I assume d57445d is fine to go into production - sending normal CORS headers for a same-origin request (e.g. if the HDF5 stack is served directly by CATMAID)

6d63612 adds a Class for stack properties, and a relation for it - although I'm not doing anything with them yet, I've just hardcoded `tile.py` to get the HDF5 I want. This doesn't need to go in right now.

18fb228 is the main meat of the PR; it adds a color picker and a number field (which will only accept uint24, for... reasons) to the filter control options, and the Object Label Color Map filter, which is pretty much like the old LabelColorMap, but it allows you to reserve two labels ('unknown' for un-segmented pixels and 'background') and assign them specific colours. All other labels are assigned a colour based on the hash of that label, and a user-specified alpha. I've renamed the old LabelColorMap to RandomLabelColorMap, for clarity.

~~One remaining issue is that the background and unknown colours multiply the image stack colours - i.e. even if the 'unknown' alpha is set to 0, everything under it will still be slightly red. This is true for all blend modes. I suspect it's something to do with the way the color picker returns its RGB values - maybe they're not premultiplied and want to be, which is confusing webGL.~~ Fixed

Welcome to come by my desk for a demo next week (as it depends on some changes I haven't pushed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76cdcb393dca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.