# Issue

**Title:** Supported dicom tag Accession Number (0008,0050).

## Description

Hello, **in some workplaces, accession number tag (standard tag 0008,0050) is used to distinguish patients after anonymization, so it would be useful to have this indentifier in the name of converted files**.
I tried to implement it, can you please review this pull request and integrate it? Let mi know, if you have any comments.

**Struct TDICOMdata extended with accessionNumber property, modified dicom loader and supported exporting accession number into json file and using it as filename with %g modifier.** (I do not add accession number into nifti file comment.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85ca8f24767c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.