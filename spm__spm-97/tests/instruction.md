# Issue

**Title:** SCOPE: possibility to calculate or load VDM initial estimate

## Description

### Summary of changes
**GUI / workflow**

- SCOPE can be used exactly as before if no initial VDM estimate is provided (this remains the default).

- Alternatively, users can:

1. Estimate an initial VDM from fMRI phase data, if phase images are available from the fMRI  time series.

1. Provide an initial VDM directly, for example when a precomputed field map is available (after conversion to VDM).



**Initial VDM estimation**

- For option 1., a new function spm_est_vdm_from_phase.m has been added. This:

Uses ROMEO for phase unwrapping,
Converts the unwrapped phase to a VDM using sequence parameters,
Applies smoothing and extrapolation.

- If ROMEO is not present, it is automatically installed in spm/external, following a similar approach to FieldTrip.

ROMEO is written in Julia, so OS-specific compiled binaries are downloaded.
If no exact binary is available for a given OS version, the closest compatible version is used (e.g. Windows 2019 binaries for pre-2019 Windows; Ubuntu 2022 binaries for non-Ubuntu Linux systems), which has worked reliably in my experience.
The binaries are downloaded only on the first SCOPE call and only if the “calculate initial VDM estimate” option is selected.
The external/mritools folder is included in .gitignore.

- For option 1. and 2., the code uses John’s modification that allows SCOPE to initialise from a VDM estimate (commit e07216f) .



**Default Jacobian setting**
I have also changed the default Jacobian scaling option from Yes to No. Across several datasets, this appeared to produce more accurate brain boundaries in the distortion-corrected images - happy to discuss.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e75ba3cbae7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.