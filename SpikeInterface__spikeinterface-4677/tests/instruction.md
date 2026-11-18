# Issue

**Title:** Add backwards compatibility when passing sparsity kwargs to create_sorting_analyzer

## Description

In the monster #4624 we added `**job_kwargs` to `create_sorting_analyzer` and changed `**sparsity_kwargs` to `sparsity_kwargs=None`, without handling backwards compat. This PR fixes this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `918c148c4e3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.