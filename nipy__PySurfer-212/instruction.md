# Issue

**Title:** Fix annotation colors

## Description

When annotating the brain with a brain atlas, the colors are not always set right:

```python
import surfer
brain = surfer.Brain('fsaverage', hemi='both', surf='inflated')
brain.add_annotation('aparc', borders=False)
```
![fig1](https://user-images.githubusercontent.com/428273/31120297-99792860-a83c-11e7-9e03-51dc456d7d56.png)

This has to do with the reordering of `cmap` and the translation of the `ids` vector. This PR fixes it:

![fig2](https://user-images.githubusercontent.com/428273/31120304-9f2cfa98-a83c-11e7-9f37-f7adbb1fee11.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1df8c0473897`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.