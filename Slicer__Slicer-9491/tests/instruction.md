# Issue

**Title:** BUG: Only group 2D image files into image series when adding multiple files

## Description

When multiple files are added to the application (drag-and-drop, Add data dialog), the volumes reader grouped every set of files with numbers in their names into an image series, and only the first file's data was loaded. This was introduced by 0ac8f3191a ("ENH: Group files that belong together in the Add data dialog"). For example:
- Markups files (`plane_1.mrk.json`, `plane_2.mrk.json`, ...) were grouped as an image series, which then failed to load.
- 3D volumes (`frame_001.nrrd`, `frame_002.nrrd`, ...) were loaded as a single volume containing only the first file.
- Volume sequences (`seq_001.seq.nrrd`, `seq_002.seq.nrrd`, ...) were loaded as a single vector volume containing only the first file, instead of as sequences.

This PR changes the behavior so that only 2D image files (`.png`, `.tif`, `.tiff`, `.jpg` and `.jpeg` ) are grouped in  `vtkSlicerVolumesReader::ExamineFileList`. All other files are loaded normally, one by one, each with its own reader.

A small fix is also added that grouped files are recognized even if the list contained paths with inconsistent formatting (e.g., path separators. This can only happen when `ExamineFileList` is called directly, for example from Python.

Added a new `py_VolumesReaderExamineFileList` test to check that numbered markups files are not grouped, numbered 3D NRRD volumes are not grouped, and PNG series is grouped, even when it is mixed with other files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46891eee252d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.