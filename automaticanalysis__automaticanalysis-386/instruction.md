# Issue

**Title:** New Intersubject Correlation Modules (and related changes)

## Description

Hello all,

This PR contains a new intersubject correlation module and some BIDS processing extensions, as well as some minor fixes.

Overview

1) aamod_intersubject_correlation.m/xml

New module for doing intersubject correlation (voxelwise correlation of timeseries between subject pairs) that includes a number of options (global signal subtraction, save individual maps, convert r-to-Z, etc). It will do on-the-fly implicit masking as well as taking a mask from an input stream or filename.

2) aamod_render.m/xml

This a generic rendering module that inputs a (renameable) "brainmaps" input stream and will use either the spm, washu, or (new) NeuroDot rendering code. Options are provided for each render. A class interface for the NeuroDot toolbox is included (neurodotClass.m).

3) aamod_brainmaskcombine.m/xml

Modified to make the input stream renameable.

4) aas_getstreams.m

Modified to fix an intermittent crash when including modules in a tasklist that have no output streams (see Issue #383)

5) aas_processBIDS.m

Fixed a comment typo, also made cosmetic changes throughout the code.

6) BIDS_subjectfilter.m

This is a new standalone tool that will apply a "filter" (e.g., 'sex=F' or 'age<18') to participants.tsv in a BIDS directory and return a cell array of subject ID that satisfy the filter. The cell array can then be passed to aas_processBIDS to only include those subjects in the analysis.

7) aas_BIDS_boldfilter.m

Similar to BIDS_subjectfilter, but applies a filter to epi json headers to remove epi that fail the filter. It is used *after* aas_processBIDS and modifies the aap struct. A fair question is why add files in aas_processBIDS and then remove them rather than just not adding the files in the first place; the honest answer is I was never able to get that to work because of the two-pass structure of aas_processBIDS. By the time the json header information is available in the second pass, the file has already been added to various aap structure fields by the first pass. It was simpler to set this up as a separate utility rather than making extensive modifications to aas_processBIDS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `775af5637142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.