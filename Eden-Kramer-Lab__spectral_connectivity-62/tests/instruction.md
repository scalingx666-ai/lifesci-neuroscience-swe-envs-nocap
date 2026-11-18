# Issue

**Title:** fix(connectivity): robust normalization; clamp coherence to [0,1]

## Description

## Summary
- Replace zero-clamp with epsilon-clamp for denominators to prevent numerical instability
- Clip coherence magnitude and imaginary coherence to mathematically valid [0,1] range
- Add comprehensive test suite for bounds verification with edge cases

## Changes
- **coherency():** Use `xp.maximum(norm, xp.finfo().eps)` instead of `norm[norm == 0] = xp.nan`
- **coherence_magnitude():** Add `xp.clip(magnitude, 0, 1)` to ensure valid bounds
- **imaginary_coherence():** Add epsilon clamp + [0,1] clipping for numerical stability
- **New tests:** Verify bounds with random data, edge cases, and zero-power scenarios

## Risks & Mitigations
- Low risk: Mathematical constraints enforced, no API changes
- Tests confirm no new failures introduced

## Test plan
- [x] 3 new tests pass (bounds checking, edge cases, zero power)
- [x] All existing tests maintain same status
- [x] Coherence values properly bounded in [0,1] range

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e4928754bd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.