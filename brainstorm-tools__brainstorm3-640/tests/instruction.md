# Issue

**Title:** Bugfixes for FOOOF and SPRiNT

## Description

Eliminating bugs in FOOOF and SPRiNT. One bug alters results in extremely rare cases, the other addresses an inconsistency in a data field after post-processing in SPRiNT.

specparam and SPRiNT: Adjusted the min/max ranges for peak center frequency to remain in the bounds of model fitting range (e.g., 1-40 Hz). In very rare cases, a peak could be fit with a center frequency outside of the fitting range (e.g., -2 Hz, 42 Hz), even though this output either does not make sense or the data needed to make the claim is not present.

SPRiNT only: Addressed an output update issue where post-processing would update the MSE and R2 of model fits in the stats field, but not the data field (these would remain the same as without post-processing). All fields include data from post-processing only (as long as it was enabled).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe2e5bad1b21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.