# Issue

**Title:** Add only existing jsonfiles to jsonfiles and make it set

## Description

Sometimes is the return code of running dcm2niix success even though no nii files, therefore no json files were produced. This means that jsonfiles will need to remove <outfolder/bidsname.json> as it doesn't exist.

This code changes jsonfiles to set and only adds jsonfiles if they exist, meaning no need of removing nonexistent jsonfiles. 
Maybe continue can be added not only for if return code is not success, but also if no nii files are produced?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `495346bd4ed1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.