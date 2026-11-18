# Issue

**Title:** fix: processing groups serialization

## Description

fixes the issue:

```
  File "/app/.pixi/envs/fmriprep/lib/python3.12/site-packages/fmriprep/config.py", line 810, in dumps
    settings['execution']['processing_groups'] = _serialize_pg(pg)
                                                 ^^^^^^^^^^^^^^^^^
  File "/app/.pixi/envs/fmriprep/lib/python3.12/site-packages/fmriprep/config.py", line 870, in _serialize_pg
    val[1] = [val[1]]
    ~~~^^^
TypeError: 'tuple' object does not support item assignment
```

should look into adding a sessionwise test to the ci

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04ef0cf8aeef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.