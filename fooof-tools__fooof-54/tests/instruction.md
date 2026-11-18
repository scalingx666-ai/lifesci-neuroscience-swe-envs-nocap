# Issue

**Title:** Tutorials

## Description

True to 'probably over-doing it' form, the tutorial notebook has expanded to closer to a tutorial book... 

At it's core, it's the old notebook, that was starting to get a bit too long, more cleanly split up into sections, with some additions for the newer features, as well as a run-through of the algorithm, displayed through the code. 

It also hopefully, gives a sense of how I expect people to use FOOOF. 

Note: the tutorials depend on code updates from a different branch ("last_tweaks_for_real_this_time"), which is irrelevant, other than to say you can't actually directly clone this branch on run through the tutorials. 

Looking at the diff is probably useless, but if you click back to the branch (https://github.com/voytekresearch/fooof/tree/tutorials), you should be able to see the notebooks rendered, and have a scan through, to see if it all looks reasonable. 

Note: I'll wait to merge this until we've sorted out everything in #53 , then make any relevant updates here before merging everything together.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0132629ea600`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.