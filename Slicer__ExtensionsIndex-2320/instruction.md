# Issue

**Title:** ENH: Add DICOM support rule to extension metadata

## Description

Add dicom_support_rule field to extension catalog entries to enable DICOM-aware extension filtering and automatic extension activation.

Schema changes:
* Add dicom_support_rule field to extension catalog schema v1.0.1
* Field contains rule engine expression for DICOM data matching
* Uses Python rule-engine syntax for flexible DICOM tag comparisons

Extension updates with DICOM support rules:
* PETDICOMExtension: PT and RWVM modality support
* QuantitativeReporting: SEG, parametric maps, and SR support
* SlicerHeart: Cardiac ultrasound (Philips DICOM private format)
* SlicerRT: Radiotherapy modalities (RTDOSE, RTSTRUCT, RTPLAN, RTIMAGE)

This enables Slicer to automatically suggest or activate relevant extensions when opening DICOM data matching the specified rules.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `256355bd8249`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.