# Issue

**Title:** Remove Python SpikeQueue fallback and make Cython version mandatory

## Description

**Description:**

This PR removes the Python implementation of SpikeQueue and makes the C++/Cython version mandatory. Previously, Brian2 would fall back to a pure Python implementation when the Cython extension failed to build, but this fallback is no longer needed since Cython wheel distribution has become more reliable.

**Rationale:**
The Python fallback was originally added when Cython wheel builds were complex and unreliable. Since Cython distribution has improved significantly, maintaining both implementations adds unnecessary complexity and potential inconsistencies.

**Breaking Changes:**
- Installations without properly built Cython extensions will now fail with a clear error message instead of silently falling back to slower Python implementation
- Code that explicitly imported from `brian2.synapses.spikequeue` will need to import from `brian2.synapses.cythonspikequeue`


---

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a39ec68018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.