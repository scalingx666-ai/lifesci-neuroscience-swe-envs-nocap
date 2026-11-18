# Issue

**Title:** Change default printing format to PDF

## Description

On R2025b (`MATLAB Version: 25.2.0.3150157 (R2025b) Update 4`) and MacOS I get a error during Realign when the motion plots are to be printed: `Illegal device option 'psc2' specified.`  Full context here:

```
------------------------------------------------------------------------
27-May-2026 15:35:33 - Running 'Realign: Estimate & Reslice'

SPM25: spm_realign                                 15:35:33 - 27/05/2026
========================================================================
Print error: nothing has been printed.
Error using matlab.graphics.internal.mlprintjob/getOutputDevice
Illegal device option 'psc2' specified.
Completed                               :          15:36:25 - 27/05/2026
```

The fix is to change the defaults from `ps` to `pdf`. It's been tested on Realign but no other calls to `spm_print`.

---
I have read the CLA Document and I hereby sign the CLA
---

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22b5596e9717`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.