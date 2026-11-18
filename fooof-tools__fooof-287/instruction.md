# Issue

**Title:** [MNT] - Plot & report tweaks

## Description

This is a set of minor updates to plotting and styling. 

One goal is to reduce the number of warnings that are popping up - in particular around applying tight_layout, and the warnings that became more common saying "this figure can't have that". In doing so, it tweaks how plot style functions get applied (allowing for passing in None's to turn them off). It also updates how styling gets applied to group report plots, as the previous approach had issues with the twinned axes (would only get one of them, leading to different label sizes). 

In part, this relates to at some point, something external seeming to have changed in terms of interpreting the figure sizes, such that our figures now seem to be printed bigger (?). This seems to be version specific - the current PR tweaks sizes to look better for me on py3.8 (in notebooks), whereas running on py36, they now look a little small...

In terms of review - code updates are fairly minor, but it would be nice for people to check that running this branch leads to to figures that look good (hopefully a bit better than before), and that there are no / fewer warnings. 

Also - this is my final anticipated update for 1.1! After this, I have nothing else, and can think about tagging final 1.1

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8ed771263fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.