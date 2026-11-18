# Issue

**Title:** Fix: map.compute_centroids fail for maps with no fragments

## Description

```python
import siibra
mp = siibra.get_map('julich 3', 'mni152')
mp.compute_centroids()
```
expected: computes the centroids using the volumes of the map.
actual: cannot fetch the mask

This PR fixes this issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b598bba893f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.