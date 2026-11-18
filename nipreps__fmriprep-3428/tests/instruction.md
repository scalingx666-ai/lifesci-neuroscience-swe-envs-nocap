# Issue

**Title:** fix: Calculate bold mask and dummy scans in transform-only runs

## Description

This builds on #3427 to add a couple final things to the transform-only workflow:

```
fmriprep $BIDS $OUT participant --derivatives fmriprep=$MINIMAL
```

BOLD masks were not getting generated from the boldref and dummy scans were not being estimated.

This PR factors out the validation and dummy scan detection from `init_raw_boldref_wf` and uses the full workflow in fit mode and the subworkflow in transform mode.

Will rebase after #3427 is merged. Can compare now with: https://github.com/nipreps/fmriprep/compare/c28a6158e80bd054284533ff85f0ba5719606bb4...6c78e547d43ca4faa68ee72c21d872548daaf586

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c58b70e2d83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.