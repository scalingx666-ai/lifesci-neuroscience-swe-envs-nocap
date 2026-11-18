# Issue

**Title:** New Stable release (v1.0.20190720)?

## Description

- .
 - .
 - New default merge behavior `-m o` [will merge slices of a CT series when parameters differ (e.g. X-Ray exposure)](https://discourse.slicer.org/t/odd-dicom-import/7576/10) but will not separate slices in a MR series when parameters vary (e.g. echo time). The previous options `-m y` and `-m n` are still available (which force merging or separating regardless of modality). To mimic previous default behavior choose `-m n`.
 - New methods to infer slice times for [GE and Siemens sequences](https://github.com/neurolabusc/dcm_qa_stc).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54cfd5176cb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.