# Issue

**Title:** ENH: Add test subjects_dir config support, pass on tests

## Description

@mwaskom this makes the `subjects_dir` function lookup also check the config file. This might make it easier for my collaborator to use PySurfer. I also added test skipping if `fsaverage` is not present, which lead me to learn that _all_ of our tests require `fsaverage`. I guess we'll have to live with that for now...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb55949eef58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.