# Issue

**Title:** Multiple session update

## Description

1. Updated arguments to take specific session IDs.

2. Changes were copied for the most part from the infant version of the pipeline run.py file.

3. Tested with @ericearl that changes correctly parsed multiple subjects and session combinations by using the print command only argument.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37cc53b834df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.