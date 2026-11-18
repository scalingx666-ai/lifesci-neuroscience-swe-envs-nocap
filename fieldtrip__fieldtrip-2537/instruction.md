# Issue

**Title:** revision of some parts of the spatial clustering code

## Description

This PR is inspired by my attempt to run a tfce based multiple comparison correction on source reconstructed (cortical sheet) data, 15684 (space) by 15 (time). This takes quite long for a single randomization, and moreover has an enormous memory footprint.

With this PR:
-tfce  in general won't store each individual randomization in memory, thanks to reorganization of tfcestat and ft_statistics_montecarlo
-I implemented a faster version of combineClusters, which (only) outperforms the combineClusters mex-file if the spatial dimension gets large (>10000 or so) and (probably) the number of additional dimensions (time/freq) is low. 

In the process, I noticed that the original combineClusters is actually 'incorrect', in that it fails occasionally to connect isolated suprathreshold pixels in a single spatial slice to neighbouring slices. I didn't manage to get to the bottom of this, but I suspect that this may be a consequence of the order in which the spatial slices are investigated, and a 'replaceby' variable is 'in place' updated to keep track of the relabeling of the many per slice cluster indices into the lower amount of across slice clusters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ceacbc1a75c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.