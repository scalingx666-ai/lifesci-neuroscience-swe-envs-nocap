# Issue

**Title:** feat: support for parallel upload for grid-regular tasks

## Description

This enables the following motif:

```python
import gevent.monkey
gevent.monkey.patch_all(thread=False)

import numpy as np
from cloudvolume import *
from taskqueue import GreenTaskQueue, MockTaskQueue, LocalTaskQueue

import igneous.task_creation as tc

def downsample():
  cloudpath = '...'

  return tc.create_downsampling_tasks(
    cloudpath, 
    mip=0, 
    num_mips=5, 
    fill_missing=True,
  )

tasks = downsample()
tq = GreenTaskQueue('igneous-queue')
tq.insert_all(tasks, parallel=8)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad5df111f4c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.