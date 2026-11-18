# Issue

**Title:** PERF: Speed up examination and loading of DICOM data

## Description

Examining and loading DICOM data was very slow for large series. For example, for a patient with a 4D cardiac CT series (21 frames, 5628 files):

| | Before | After |
|---|---|---|
| Examine the patient (all DICOM plugins) | ~60 s | ~4.5 s |
| Load the 4D CT as volume sequence | ~52 s | ~15 s |
| Load the 4D CT as MultiVolume | ~58 s | ~24 s |

The resulting loadables and the loaded data are unchanged.

## Where the time went

- **Examination:** retrieving values from the DICOM database. There were about 260,000 `slicer.dicomDatabase.fileValue()` calls, each requiring two database queries. Some plugins also parsed files unnecessarily, or examined the same files many times.
- **Loading:** reading the image data of the frames, one after the other (about 2.2 seconds for each 268-slice frame).

## Changes

- **COMP: Update CTK.** Includes  The new CTK adds `ctkDICOMDatabase::fileValues()`, which returns the value of a tag for many files using batch database queries (0.02 ms per value instead of 0.165 ms). It does not keep any state between calls, so it is safe to use when the database is modified by another process.
- **BUG: Do not ignore all files if one DICOM instance has no instance UID.** The SEG, parametric map, and TID1500 plugins returned no loadables at all if any examined file had an empty SOP instance UID. Now only the invalid instance is skipped.
- **PERF: Speed up examination of DICOM series in several plugins.**
  - `MultiVolumeImporterPlugin`: to find the first slice of each frame, sort the frame's files with `DICOMUtils.getSortedImageFiles()` instead of examining each frame with the scalar volume plugin.
  - `DICOMTID1500Plugin`: only parse files with pydicom if their modality in the database is SR.
  - `DICOMSegmentationPlugin`, `DICOMParametricMapPlugin`: check the modality or SOP class first, and only retrieve other values for matching files.
  - `DICOMScalarVolumePlugin`:
    - retrieve pixel data presence once per file instead of once per loadable;
    - check the SOP class only for files without pixel data;
    - skip the numerical comparison of orientation vectors for exactly matching values;
    - log the missing SlicerRT warning only once.
- **PERF: Retrieve DICOM tag values of all files at once in DICOM plugins.**
  - New `DICOMUtils.fileValues(filePaths, tag)` function, which uses `ctkDICOMDatabase::fileValues()` when available, and falls back to retrieving values one by one with older CTK versions.
  - It is used wherever a value is needed for all examined files: `getSortedImageFiles()`, the sub-series detection of the scalar volume plugin, the frame detection strategies of `MultiVolumeImporterPlugin`, and the SOP class or modality checks of the other plugins.
- **PERF: Read image data of multiple frames in parallel when loading 4D volumes.**
  - New `DICOMScalarVolumePluginClass.prepareReaders(loadables)` method, which reads image data of multiple loadables in parallel threads (up to 8). The ITK readers do not use the MRML scene, and VTK releases the Python GIL while they run.
  - `load()` uses the prepared image data. The reader approach setting and the GDCM→DCMTK fallback work as before.
  - `MultiVolumeImporterPlugin` reads the frames in batches in parallel. MRML nodes are still created in the main thread, and the progress dialog and cancel still work.
  - Temporary frame volumes, which are removed right after their content is copied into the volume sequence or multivolume, are not added to the subject hierarchy and not shown in views.
- **PERF: Share DICOM tag values retrieved by plugins while examining or loading.**
  - New `DICOMUtils.fileValuesCaching()` context manager, which caches values retrieved by `DICOMUtils.fileValues()` and shares them between all plugins. Multiple plugins often retrieve the same values (for example, the SOP class UID of all files).
  - It is used by `getLoadablesFromFileLists()` and `loadLoadables()`. The cache is discarded at the end of each operation, so database changes made by other processes are taken into account in subsequent operations.

## Examination time

Patient with a 4D cardiac CT series (5628 files) and 9 other series, all DICOM plugins, Windows, Release build:

| | Time |
|---|---|
| Before | ~60 s |
| Plugin changes (first PERF commit) | ~26 s |
| + batch retrieval (`fileValues()`) | ~6.8 s |
| + shared value cache | ~4.5 s |
| Batch retrieval with old CTK (fallback) | ~21 s |

## Testing

Windows, Release build of this branch:

- The loadables of the patient above (names, tooltips, files, confidence, selection, warnings) are identical to the loadables before the changes (also with the fallback for old CTK versions).
- The volume sequence and MultiVolume loaded with parallel reading are identical to the ones loaded sequentially (voxel data, geometry, and node attributes of each frame).
- All DICOM, sequence, and multivolume related tests pass (25 tests).
- In the new CTK, `fileValues()` and `fileValue()` return identical values for all 48 tags used by the DICOM plugins, across 5751 files.

Loading times were measured with the DICOM files already in the file system cache. Reading from disk (first load after import) takes longer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ff6f0cc160a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.