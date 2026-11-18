# Issue

**Title:** FIX: overlay plot background is masked

## Description

Currently, plotting an image with an overlay - particularly a mask-like overlay - will have a weird background due to the overlay.  This fixes that issue by masking the overlay where it is equal to zero. 

Example here - the background should be black:

```python
import ants
img = ants.image_read(ants.get_data('mni'))
mask = img > 6000
img.plot(mask)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3dcfdeb567e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.