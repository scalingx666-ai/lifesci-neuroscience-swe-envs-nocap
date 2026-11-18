# Issue

**Title:** Fix image query

## Description

```python
import siibra
fts = siibra.features.get(siibra.get_template('mni152').get_boundingbox(), siibra.features.cellular.CellbodyStainedSection)
assert len(fts) == 47
```
But as of  siibra cannot find any.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d39094856c16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.