# Issue

**Title:** Add rigid and similarity transformations for landmarks

## Description

As discussed in #1856.

Note this only adds the models to the landmark widget, not yet to the similarity widget.

While these models are directly reproduced from the MPICBG libraries like the affine model, the results are not very good for the tests I've done with the left/right hemispheres. However, for simple toy examples the results are what one would expect. Either these models are not particularly suited for this domain, or there is some limitation in the implementation for complex transforms. The MPICBG implementation doesn't seem to exactly match any of the published methods I found, so I will follow up with the implementation authors.

PRing until that follow up is done.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a44ca63762a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.