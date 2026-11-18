# Issue

**Title:** fix new line for warning message

## Description

Fix stdout from
```
Warning: Intensity scale/slope using 0028,1053 and 0028,1052Convert 1 DICOM as /flywheel/v0/work/mDIXON_Quant_BH_901_WIP_mDIXON-Quant_BH_20180110130625_901_e2_fieldmaphz (288x288x38x2)
```
to
```
Warning: Intensity scale/slope using 0028,1053 and 0028,1052
Convert 1 DICOM as /flywheel/v0/work/mDIXON_Quant_BH_901_WIP_mDIXON-Quant_BH_20180110130625_901_e2_fieldmaphz (288x288x38x2)
```

which let nipype interface parse the output correctly...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b502450c3d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.