# Issue

**Title:** fix(pet004): Convert percentages to fractions from 0-1

## Description

Discovered in  The schema states that `metabolite_parent_fraction` has a minimum of 0 and a maximum of 1, while these values appear to be percentages. I converted to decimals, and changed `-0.22` to a more plausible `0.22`.

@mnoergaard I believe you added this example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8417d0645e6e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.