# Issue

**Title:** User-specified RGB range syntax

## Description

Refactor the API for specifying Volume/VertexRGB color ranges. The old arguments allowed for
- auto individual range
- auto shared range
- manually-specified common range

but not manually-specified ranges for each channel.

This replaces the old arguments of 
`shared_range`, `shared_vmin`, and `shared_vmax`
with
`autorange`, `vmin`, and `vmax` where
- `autorange` is a string in `['shared', 'individual']` that specifies how the auto range should be determined
- `vmin` and `vmax` are either `float`s or `Tuple<float, float, float>`s. If they are floats, it's a shared manual range. If tuples, it's manual specific ranges for each channel. These default to None to allow for autorange. If values are provided, they override autorange.

I made a PR since this breaks code that uses those old arguments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `634da79af2f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.