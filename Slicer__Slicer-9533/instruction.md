# Issue

**Title:** PERF: Pre-cache tags of DICOM plugins in the visual DICOM browser

## Description

The visual DICOM browser has its own database object, which did not get the tags of the DICOM plugins that are set in the main database object. These tags were therefore not pre-cached when data was imported in the visual browser. Plugins then had to read the values from the files one by one when examining the imported data, which is magnitudes slower.

The tags to pre-cache and the number of import threads are now copied from the main database object when the visual browser is created.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a68359e86d16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.