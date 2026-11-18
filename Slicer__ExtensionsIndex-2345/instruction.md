# Issue

**Title:** ENH: remove dcmqi extension

## Description

It should be included in the Slicer core now that  is merged.

QuantitativeReporting dependency on dcmqi was removed via 

PETLiverUptakeMeasurement moved to archive until it is updated to not depend on the DCMQI extension.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90932855ebfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.