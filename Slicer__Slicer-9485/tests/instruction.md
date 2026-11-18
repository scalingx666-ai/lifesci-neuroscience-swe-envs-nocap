# Issue

**Title:** BUG: Fix intermittent crash when loading the first 4D DICOM volume

## Description

Image data of multiple frames of 4D volumes is read in parallel (`DICOMScalarVolumePlugin.prepareReaders`, added in 64c6145747). Some global state of the image readers (in ITK and GDCM/DCMTK) is initialized when an image is read the first time in the application, which is not thread-safe. If the first image reading in the application happened in parallel, Slicer crashed (heap corruption `0xc0000374` or access violation, with all crashing threads in `reader.Update()` called from the thread pool) or hung.

This change reads the first image before reading the others in parallel, the first time an image IO (GDCM or DCMTK) is used for reading in the application. Subsequent loads read all frames in parallel, as before.

### Testing

Loading a synthetic 4D (multi-frame, trigger time) MR DICOM data set (4 series, 6 frames each) as volume sequences via `MultiVolumeImporterPlugin`, once per freshly started Slicer process (Windows, Release build):

| | Failed runs |
|---|---|
| Before | 3 / 20 (1 heap corruption, 2 access violations) |
| After | 0 / 30 |

Loading the same data set 40 times within a single process did not fail even before the change, which is consistent with a race in first-use initialization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96283cec66e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.