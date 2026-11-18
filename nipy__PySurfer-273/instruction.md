# Issue

**Title:** ENH: Allow painting all annotation vertices in a single color

## Description

A small enhancement that makes it easy to show the borders between annotation labels in a single color. This makes less distracting figures in cases where you want to overlay an annotation on a statistical map and either know what each parcel represents or don't precisely care.

e.g.

```python
from surfer import Brain
b = Brain("fsaverage", "lh", "inflated")
b.add_annotation("aparc", color="dodgerblue")
```
![annot_edges](https://user-images.githubusercontent.com/315810/62878316-d8653980-bcf6-11e9-893e-881f9eeecfc8.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b2474cfa1f3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.