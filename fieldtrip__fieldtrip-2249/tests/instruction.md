# Issue

**Title:** ENH - speed up ft_affinecoordinates

## Description

- this is an alternative to the suggested PR #2236
- it closely follows the logic of ft_senslabel
- it is also more aligned with how we use persistent variables elsewhere

This

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `363aca7d3ead`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.