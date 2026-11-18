# Issue

**Title:** Add MicroViewVFF extension

## Description

New extension: **MicroViewVFF**

Reads and writes GE eXplore / MicroView micro-CT volumes in VFF format, including the GE `ncaa` header (voxel size from `elementsize`, Hounsfield calibration from `water`/`air`) and the minimal VFF headers written by reconstruction toolkits. Files open directly through Add Data; volumes can be exported back to VFF for MicroView.

Repository: https://github.com/UBC-Ford-lab/SlicerMicroView
License: MIT
Tier: 1

Tested with Slicer 5.12.3 on macOS with 1.4 GB and 2.1 GB GE eXplore CT 120 reconstructions; the module includes a self-test with synthetic files covering both header dialects, HU rescaling and writer round trips.

Checklist (tier 1):
- [x] Extension name reasonable
- [x] Repository name is Slicer+ExtensionName
- [x] Repository has topic `3d-slicer-extension`
- [x] Description summarizes purpose in 1-2 sentences
- [x] No known related patents
- [x] LICENSE in repository root, license named on homepage
- [x] scm_url / scm_revision correct
- [x] Icon URL is a raw-data URL
- [x] Screenshot URL correct
- [x] JSON consistent with top-level CMakeLists.txt
- [x] Homepage contains name, description, image, module descriptions
- [x] Unused GitHub features hidden
- [x] No binaries, no data sent without opt-in

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0848e9df94ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.