# Issue

**Title:** feat(gpu): raise clear error when GPU requested but CuPy missing

## Description

## Summary
- Replace silent CPU fallback with explicit RuntimeError when GPU is explicitly requested but CuPy is unavailable
- Provide clear, actionable error message with installation instructions
- Improve user experience for GPU setup issues

## Behavior Change
**Before:** Silent fallback to CPU with print message when `SPECTRAL_CONNECTIVITY_ENABLE_GPU='true'` but CuPy missing
**After:** Explicit RuntimeError with installation guidance

## Changes
- **3 modules updated:** connectivity.py, transforms.py, minimum_phase_decomposition.py
- **Error message:** Includes environment variable context and specific install commands
- **CPU fallback preserved:** Only affects explicit GPU requests, not default behavior

## User Experience
```python
# Example error message:
RuntimeError: GPU support was explicitly requested via SPECTRAL_CONNECTIVITY_ENABLE_GPU='true',
but CuPy is not installed. Please install CuPy with: 'pip install cupy' or 'conda install cupy'
```

## Test plan
- [x] Error message format validation
- [x] Preserves existing behavior for non-GPU usage
- [x] All existing tests maintain same status

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `088ef20717c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.