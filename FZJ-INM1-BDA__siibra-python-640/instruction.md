# Issue

**Title:** v0.4 EOL - match region specs of features to higher level regions

## Description

The following tests are failing for 0.4EOL (> v1.x pass these tests):
```python
import siibra
r = siibra.get_region('wax', 'Fasciola cinereum')
fts = siibra.features.get(r, 'receptor')
assert len(fts) > 0
assert fts[0].last_match_description == "'Hippocampal region' contains 'Fasciola cinereum'"

ebrains_fts = siibra.features.get(r, 'ebrains')
assert len(ebrains_fts) >= 4  # currently there is 4 but there can be more
```
This PR addresses it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8299b12c25c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.