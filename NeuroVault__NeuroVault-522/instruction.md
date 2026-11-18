# Issue

**Title:** Fix nidmviewer

## Description

This PR will do minor tweaks to close #521. Specifically, the nidmviewer version 0.1.3 has the check for empty images as a variable with default set to False, so maps are not checked for these voxels. Hopefully in the future the nidm results object can contain this information to make this check not necessary. Second, since we now are dealing with excursion sets, I added the `excsetmap_location` to the columns to remove variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdef5df1a2b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.