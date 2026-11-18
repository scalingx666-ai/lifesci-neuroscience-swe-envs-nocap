# Issue

**Title:** fix: Default to grid-constant interpolation mode

## Description

This is a potential fix to #3475 and #3508. To test:

```
git clone https://github.com/nipreps/fmriprep.git fmriprep-3516
git -C fmriprep-3516 fetch origin refs/pull/3516/head
git -C fmriprep-3516 checkout FETCH_HEAD
fmriprep-docker [NORMAL ARGS] --patch fmriprep=$PWD/fmriprep-3516/fmriprep
```

@claraElk @HippocampusGirl Could you verify that this does not re-introduce the problems we were trying to fix in #3453?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cfe7a0600074`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.