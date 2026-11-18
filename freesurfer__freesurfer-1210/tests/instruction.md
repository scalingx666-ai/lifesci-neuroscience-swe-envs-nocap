# Issue

**Title:** Fixed bug where the script would reference the intermediate .txt files under mri/

## Description

Script was looking under SUB/mri for the text files that are generated and used to construct the .stats files for the subfields segmentations. Updated the script to reference the files under the stats/ dir, and updated how the files are parsed to match the formatting of the *.stats files.
Fixed bug where 'left_' would be prepended to all ROI names, dropped the hemi naming from the fields, this is reported in the file name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28cf26db4324`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.