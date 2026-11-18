# Issue

**Title:** Fix invalid spm_mesh_area argument in mesh smoothing

## Description

### Problem

`spm_eeg_smoothmesh_mm` calls `spm_mesh_area(M,1)`, but the current implementation of `spm_mesh_area` accepts the string options `'sum'`, `'face'`, and `'vertex'`, or a logical argument for backward compatibility.

Passing the numeric value `1` raises:

```text
Error using spm_mesh_area
Unknown option.
```

This prevents millimetre-scale smoothing during MEG source inversion, including when a previously computed smoothing kernel exists, because the area calculation occurs before the cached-file check.

### Fix

Replace the numeric argument with the explicit `'face'` option.

### Reproduction

Observed using official `spm-python` 25.1.2.post2 with MATLAB Runtime R2025b, when performing an EBB inversion with a 5 mm cortical smoothing kernel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4043ce6a2d79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.