# Issue

**Title:** NF: added the option to specify alpha transparency for Brain binarized curvature rendering

## Description

I have added the option to specify alpha transparency for Brain binarized curvature rendering. This can be useful when plotting foci in internal structures that are otherwise obscured by the brain surface. I had considered adding an "alpha" keyword to the Brain interface, but opted instead to allow for alpha transparency to be specified in the cortex keyword. I've implemented the chance in a way that should ensure backward compatibility with code specifying the cortex keyword as a 4-tuple or string (in these cases alpha defaults to 1.0). Using a new alpha transparency keyword for the Brain constructor might make this feature more accessible and I'm happy to change the implementation accordingly if that's preferred.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6350fd9192d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.