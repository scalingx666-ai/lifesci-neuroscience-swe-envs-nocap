# Issue

**Title:** enable loading of pycortex datasets that have old subject names

## Description

Added  keyword to Dataset.from_file and propagated so saved datasets with old subject names can be loaded with new subject name. This has happened fairly often esp with early saving of e.g. localizer data for WIP subjects (saved as a dataset for MLwip or whatever, then can't load saved data once 'wip' is removed from subject name). 

Should be a harmless add.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1341103288b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.