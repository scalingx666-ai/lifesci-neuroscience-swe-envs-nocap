# Issue

**Title:** ENH: added Apply VDM functionality to FieldMap SPM interface

## Description

This pull request substitutes an old one: 

ENH/WIP: added Apply VDM functionality to FieldMap SPM interface #2879 

I only adapted what was done there to the present nipype version.


This allows to apply a VDM directly to functional images to correct for inhomogeneities of the magnetic field. At the moment this could be performed by the realign&unwarp spm interface, which also corrects for artefacts derived by interactions between subject movement and inhomogeneities of the magnetic field. However, if one wishes to perform slice timing and realign correction in one step, using the SpaceTimeRealigner nipy module, this requires the field map correction to be executed independently from the realignment.

This was also a TODO item for issue:
[ENH/WIP] Add SPM Fieldmap Tool wrapper #1905

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb3c3121e4d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.