# Issue

**Title:** Philips enhanced survive implicit

## Description

This patch makes dcm2niix more robust to manipulation of Philips DICOM enhanced images.

Critical diffusion parameters are stored Philips private SQs such as 0018,9117. Conversion to implicit VR using dcmconv +ti ex.DCM im.DCM removes the "SQ" VRs, and the resulting tag explicitly provides the length for the whole SQ. The private SQs effectively become old-DICOM style shadow groups. This requires an explicit dictionary that identifies which private tags are actually SQs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `356ab201f9c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.