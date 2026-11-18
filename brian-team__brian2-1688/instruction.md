# Issue

**Title:** Fix backwards compatibility for Python spike queue stored states

## Description

#### Problem

Users who previously stored network states using the Python spike queue fallback (before Cython spike queue became mandatory) cannot restore these files with current Brian2 versions. This creates a backwards compatibility regression where valid saved states become unusable.

**Error when loading Python spike queue states:**
```
ValueError: too many values to unpack (expected 2)
```

**Root cause:** The two spike queue implementations use different internal state formats:
- **Python format:** `(time, spike_array, dimensions)` - stores relationships as `[delay_bin, synapse_index]` pairs
- **Cython format:** `(offset, spike_lists)` - stores spike lists per delay slot in circular buffer

Fixed now : 

<img width="1063" height="437" alt="Screenshot 2025-09-19 at 18 47 47" src="https://github.com/user-attachments/assets/322874e2-a9b9-4c0d-bbe9-4ce92918b520" />

cc : @mstimberg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3af71d688f1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.