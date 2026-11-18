# Issue

**Title:** [math] add ``ein_rearrange``, ``ein_reduce``, and ``ein_repeat`` functions

## Description

Examples:

```python
import brainpy.math as bm

# rearrange elements according to the pattern
output_tensor = bm.ein_rearrange(input_tensor, 't b c -> b c t')
# combine rearrangement and reduction
output_tensor = bm.ein_reduce(input_tensor, 'b c (h h2) (w w2) -> b h w c', 'mean', h2=2, w2=2)
# copy along a new axis
output_tensor = bm.ein_repeat(input_tensor, 'h w -> h w c', c=3)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fed5db478fc8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.