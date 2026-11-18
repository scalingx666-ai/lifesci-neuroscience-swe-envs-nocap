# Issue

**Title:** Fix: get_region(spec) exact match if spec is a region key

## Description

```ipython
import siibra
p = siibra.parcellations['julich 3.1']
p.get_region('LP (Thalamus, lateral posterior Nucleus) right')
```
expected:
```python
<Region(identifier='minds/core/parcellationatlas/v1.0.0/94c1125b-b87e-45e4-901c-00daee7f2579-310_LP_THALAMUS_LATERAL_POSTERIOR_NUCLEUS_RIGHT', name='LP (Thalamus, lateral posterior Nucleus) right', species='Homo sapiens')>
```
but it was raising RuntimeError. This PR fixes this issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a27bd8f5ceb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.