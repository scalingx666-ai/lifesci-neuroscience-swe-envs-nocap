# Issue

**Title:** ENH: Add appropriate titles to HTML reports

## Description

Noticed that nireports injects its own title, because we aren't adding ours:

![image](https://github.com/nipreps/fmriprep/assets/83442/bad4ff13-1f54-42ef-a8e7-bdf1accc3719)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c4cb04b22b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.