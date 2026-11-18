# Issue

**Title:** [media] Fix multilingual visits filter

## Description

## Brief summary of changes

This PR fixes the filtering of visits when the language is set to something other than English.

#### Testing instructions (if applicable)

1. Go to 'Clinical' -> 'Media'
2. Switch the language to 'French'
3. Test the Visit Label filter
4. Verify that each option returns the corresponding rows instead of always returning zero results

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3941da304e62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.