# Issue

**Title:** dcm2niix_fswrapper and libdcm2niixfs.a

## Description

1. save dicom file list in MRIFSSTRUCT, return vector of MRIFSSTRUCT for multi-echo scans if isForceStackSameSeries = 0 (-m n)
  2. change output file format to "%4s.%d" from "%4s.%p" to be consistent with Freesurfer dcmunpack
  3. remove space, [, ] from scan description
  4. implement isDumpNotConvert option to retrieve dicom info only
  5. dcm2niix_fswrapper::dicomDump() - output information of series to be converted, and seriesNum-dicomflst.txt in the same directory as series-info.dat; dcm2niix_fswrapper::seriesInfoDump() - print information for given dicom series
  6. don't use std::max() from <algorithm> (fix Freesurfer ubuntu18 compiler error)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2b6d1a851de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.