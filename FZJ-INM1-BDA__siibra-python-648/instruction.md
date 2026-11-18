# Issue

**Title:** check all gene exp measurements at once for intersection

## Description

Speeds up Allen gene query.

Code to test:
```python
import siibra
import time
fg2 = siibra.get_region('julich 2.9', 'fg2 left')
genes =  "MAPT CLU APOE ARC NR4A1 NR4A2"
s = time.time()
siibra.features.get(fg2, siibra.features.molecular.GeneExpressions, gene=genes.split())
print(time.time() - s)
```

The following used to take much longer. Now takes the ~ same time.
```python
import siibra
import time
fg2 = siibra.get_region('julich 2.9', 'fg2 left')
genes =  "MAPT CLU APOE ARC NR4A1 NR4A2"
s = time.time()
vol = fg2.get_regional_mask(space='mni152', maptype='statistical', threshold=0.3)
siibra.features.get(vol, siibra.features.molecular.GeneExpressions, gene=genes.split())
print(time.time() - s)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d97f07e4e3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.