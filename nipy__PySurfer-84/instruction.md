# Issue

**Title:** ENH montage:  add 2d grid option

## Description

First step following up on discussion in  to add to make_montage the capability to create 2d grids

``` python
import surfer

subject_id = 'fsaverage'
std_args = [subject_id, 'lh', 'inflated']
small_brain = dict(size=100, width=500, height=500)

brain = surfer.Brain(*std_args, config_opts=small_brain)

brain.save_montage("test_2d.png", [['l', 'v'], ['m', 'f']])
```

![test_2d](https://f.cloud.github.com/assets/145771/1951507/c9295d86-8181-11e3-9985-aa20ac85e3bb.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d295bfbe2f7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.