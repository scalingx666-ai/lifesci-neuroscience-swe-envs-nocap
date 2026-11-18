# Issue

**Title:** Adds Mesoscan test. Reinstates classify.py. Refactors test/utils funcs.

## Description

Remade PR #507. Does the same thing: 

1. Adds a test for the mesoscan data Marius provided. I ended up generating the prior output from the following commit eaeddbb6cd32322b051c0263e38a0fc3abfd9a3d. 7bbbf57815c4aaac19ead79e1d31565663687f3b, the commit corresponding to the release of v0.7.5 and also the commit i based much off the regression tests off, errored whenever preclassify was used. Later commits (like 142ed8bdac70061c8960bb0841b90a10faa3c705) that had preclassify working had an issue with the default keys parameter in classify not containing `skew` due to issue with mutable defaults (discussed ). Skew's not added to stats until the extraction step so anytime preclassify was > 0, any classify() calls made later on in the pipeline would have keys=['npix_norm', 'compact'] only.
2. test/utils.py was refactored to work with checking the outputs of the mesoscan data. 
3. Added back classify.py with the classify func as requested [here](https://github.com/MouseLand/suite2p

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `181e61836322`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.