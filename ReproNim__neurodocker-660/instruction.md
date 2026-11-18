# Issue

**Title:** Update freesurfer.yaml

## Description

the way it was currently specifified was causing the next comment to be part of the variable: 
```
ENV FSF_OUTPUT_FORMAT="nii.gz# mni env requirements"
```

but should have been:
```
ENV FSF_OUTPUT_FORMAT=".nii.gz"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dda707fb6cb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.