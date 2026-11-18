# Issue

**Title:** Use dict.fromkeys for removing duplicates  in feature query (for reproducible results order)

## Description

- Also update parse_featuretype to ignore higher level feature classes (only if they are not requested specifically).
- tidy up feature.match to use list of feature type query when string is provided

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5dd422a8595a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.