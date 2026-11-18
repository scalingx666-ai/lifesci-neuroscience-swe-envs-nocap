# Issue

**Title:** TVB-3103. Update siibra version to 1.0a5

## Description

In this PR I updated the siibra creator page to make it compatible with the newest released version of siibra (1.0a5). The most important change is that the EBRAINS access token is not required anymore to get data from the KG about structural and functional connectivities, so we removed it.
Regarding the notebooks, one was updated and one was removed, as it was only intended for the siibra tutorials repo, but it never got merged.

Some more information regarding this new version of siibra can be found in this , which I opened on siibra's github to discuss the removal of the EBRAINS token.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc81607e75e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.