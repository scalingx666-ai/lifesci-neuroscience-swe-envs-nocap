# Issue

**Title:** [WIP - URGENT] update and refactor find_similar()

## Description

This is needed, since we don't want to limit the comparison between metrics to the first 100 results.
- 100 results limit for the find_similar view (html)
- no limit for json response

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `454efde26126`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.