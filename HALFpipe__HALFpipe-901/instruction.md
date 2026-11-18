# Issue

**Title:** spreadsheet is a string

## Description

recently posted error shows this:
```
 File "/opt/conda/envs/fmriprep/lib/python3.11/site-packages/halfpipe/design.py", line 55, in prepare_data_frame
│ 	    data_frame = spreadsheet.copy()
│ 	                 ^^^^^^^^^^^^^^^^
└─	AttributeError: 'str' object has no attribute 'copy'
```
I think that what happens is that instead of path a string is passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5ff61eb3e46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.