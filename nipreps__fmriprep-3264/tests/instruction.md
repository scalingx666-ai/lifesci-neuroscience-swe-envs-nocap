# Issue

**Title:** ENH: Support named derivative paths

## Description

.

## Changes proposed in this pull request

- Copy over `ToDict` action from fmriprep-docker over to the main CLI parser.
- Modify the Config to handle named derivative paths.
    - E.g., `--derivatives anat=/path/to/smriprep` --> `DatasetLinks = {'anat': '/path/to/smriprep'}`
- Infer derivative name from the folder name of the derivative path if it isn't labeled.
    - E.g., `--derivatives /path/to/smriprep` --> `DatasetLinks = {'smriprep': '/path/to/smriprep'}`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eb8215e9a4e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.