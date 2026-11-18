# Issue

**Title:** Add templateflow to DatasetLinks

## Description

References #3261.

## Changes proposed in this pull request

- Add the TemplateFlow base directory to the DatasetLinks.
- Add the template used for normalization to the Sources for standard-space volumetric outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `123c3f88d1f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.