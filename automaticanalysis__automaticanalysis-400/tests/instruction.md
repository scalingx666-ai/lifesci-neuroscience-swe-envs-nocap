# Issue

**Title:** Fall 2024 bugfixes

## Description

Hello all,

This PR has a few minor bugfixes and an extension to aamod_firstlevel_model:

1) aas_processBIDS -- fixed a tsvread bug where it will calculate a wrong line count if the terminal newline character is missing in the tsv file.

2) washu_surfacerender -- fixed a bug in explicit color scaling.

3) aamod_secondlevel_randomise -- Apple changed their unix "sleep" syntax so I changed file blocking to use Matlab "pause" instead.

4) aamod_firstlevel_model -- added an explicit mask option we need for our work using aa to analyze HDDOT data. HDDOT doesn't provide a structural image, so you need to pass a mask based on the optode array field of view (or use SPM implicit masking, which can be unreliable). Also, I reinstated the physreg stream to the header which somehow got deleted. Note this file is committed twice in the PR -- the first time I used the wrong version and just adding a new commit seemed less error-prone than attempting clever git-fu to delete the first commit...)

5) Finally, I added a new module: aamod_joyplot. This creates a "joyplot" of functional data which we find provides better QA information than a greyplot (aka carpetplot). Perhaps others might find it useful.  Here's an example:

![sample_joyplot](https://github.com/user-attachments/assets/7776eb5e-02ae-4ec7-bf7c-8b9cd9cb5959)

The module also plots all outliers in the dataset, which we find helpful to identify artifacts that are correlated across subjects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `882d9ac76a98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.