# Issue

**Title:** GE MR30 DWI: bvecs for VascularCollapseFlag 3/4/5; no spurious missing-images message

## Description

Two GE MR30+ issues reported by Rob Reid (Mayo), with flag/DFAX semantics from GE (Jaemin Shin).

**1. Spurious "DICOM images may be missing"**
On GE software ≥ 30, `(0020,1002)` ImagesInAcquisition counts every image. If a site strips `(0021,104F)`, dcm2niix took the total as slices per volume and printed e.g. "expected 210 … found 42" for complete series. The message is now suppressed only for GE software ≥ 30 with 1002 present, 104F absent, and the expected count equal to the images converted. An explicit 104F count, or older GE where 1002 counts slices, still warns.

**2. DFAX "ALL" DWI: directional volumes had zero bvecs**
GE writes zeros to `(0019,10BB-D)` outside TENSOR mode. EPI images with VascularCollapseFlag `(0043,1030)` 3/4/5 (R/L, A/P, S/I) now get a world-frame unit vector, which `siemensPhilipsCorrectBvecs` rotates to image space. Oblique flags 9/10/11 are left at zero. Trace vs b=0 reference is now decided per volume. Flag 14 (T2) forces bval 0, because ALL mode reports `(0019,10E0)`=0 even for T2 and older GE gives T2 bval>0.

**Behavior changes**
- A 5-volume ALL DWI (trace, T2, R/L, A/P, S/I) used to give one file with zero bvecs. It now gives `name.nii` (T2 + 3 directions, with bvecs) plus `name_ADC.nii` (all 5). The trace is only in the `_ADC` file.
- A TENSOR series that contains a flag-15 trace image now splits it to `_ADC`. Before, its b-value was set to 0 when the first image was not trace.

**Validation**
- The two GE-supplied MR30 series (ALL b0+trace, TENSOR) give identical output; JSON differs only in the version.
- Flags 3/4/5 were tested **only on synthetic data**. A local suite (`dcm_qa_ge_dwi`, not yet published because sharing permission for the source data is unconfirmed) covers: ALL trace-first and T2-first, legacy T2 with bval>0, TENSOR with flag-16 zero-vector reference plus flag-15 trace, explicit-104F missing slices, and MR29 missing slices. The patch passes; development fails every DWI case. Rob's Madison phantom is still needed as the real-data test.
- dcm_qa, dcm_qa_nih, dcm_qa_uih and 44 dcm_validate suites pass. `dcm_qa_spec` differs only in the NIfTI-MRS embedded version string, from the kDCMdate bump to v1.0.20261028.
- Two independent audits and an external review. Their findings (series-wide trace flag, over-broad message suppression, older-GE slice semantics, PC-MRA flag reuse) are fixed in d9bfa27.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b82752368ce4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.