# Issue

**Title:** [ENH] Added a tutorial dataset fetcher

## Description

This PR adds a MATLAB dataset fetcher for the tutorial data. PR  

Example usage is:
```MATLAB
[image_data, demographic_data] = fetch_tutorial_data('n_subjects', 17);
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `912b23854fc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.