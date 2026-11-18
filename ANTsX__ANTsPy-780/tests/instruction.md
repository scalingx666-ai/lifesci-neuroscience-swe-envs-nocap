# Issue

**Title:** ENH: Prevent attempts to iterate over antsImage

## Description

Because `antsImage.py` did not explicitly define `__iter__`, Python builtin iterator methods would call `__getitem__` directly, which breaks the object state.

Example:

```
im = ants.image_read('t1w.nii.gz')
im.sum() # works
sum(im) # error
im.sum() # now also errors
im[0,0,0] # now also errors
```

To prevent this, I added `__iter__` which raises a TypeError. Built-in iteration methods like sum() can be much slower than using numpy, so I didn't want to enable that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5768746ad817`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.