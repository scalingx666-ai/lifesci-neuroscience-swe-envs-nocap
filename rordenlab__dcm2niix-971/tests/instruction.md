# Issue

**Title:** bvec signs for GE DTI with Coronol + ROW

## Description

## Summary
`dcm2niix` (v1.0.20250626) produces **incorrect bvec signs** for **GE DTI acquired with Coronal + ROW phase-encoding** (with warnings). Other plane/phase combinations appear correct (Axial/Sagittal with COL/ROW and Coronal with COL).

**Root cause:** For Coronal + ROW, performing the **ROW swap/negate before** the plane-flip yields an incorrect combination of sign flips.

**Proposed fix:** Apply the **plane‑dependent flip first**, then apply the ROW remap, and negate the first element after the swap. This preserves existing, validated behavior for all other cases while correcting Coronal+ROW.

**Impact:** Affects **GE DTI with Coronal+ROW** only


**Order Change:**
```
**BEFORE**: ROW → plane‑dependent flip → always-negate-Y → negate-all
**AFTER**:  plane‑dependent flip → always-negate-Y → ROW → negate-all
```

**Implementation (GE → FSL bvec)**
While dcm2niix GE → FSL bvec code is somewhat complicated (derived from xiangruili's dicm2nii) with some differences:
- Y-direction handled opposite to dicm2nii
- Negate all components for compatibility

**Current sequence**:
  1. ROW swap first (if !col)
    - swap X ↔ Y, then negate Y
  2. Apply plane-dependent flip
  3. Always negate Y
  4. Negate all components (compatibility)

**Proposed sequence:**
  1. Apply plane-dependent flip first
  2. Always negate Y
  3. ROW swap last (if !col)
    - swap X ↔ Y, then negate X
  4. Negate all components (compatibility)

** for Validation Results and Investigation Details**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `deed8f3f94e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.