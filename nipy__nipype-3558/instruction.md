# Issue

**Title:** [ENH] Enable SPM voxel-based FDR

## Description

Hi,

The SPM interface currently does not support voxel-based FDR. The MATLAB version of SPM readily provides this functionality, however, if you change your SPM defaults accordingly. There is no easy way to achieve this in nipype. I believe that FDR is a very useful way of correcting for multiple comparisons when analyzing fMRI data. Other users share this view because a similar PR has already been made by Lorenzo . The changes proposed in my PR are minimally invasive and thus are very unlikely to cause any problems with respect to backward compatibility. 

## List of changes proposed in this PR (pull-request)
* Added a single new binary (Boolean) input for whether or not the user wants to use voxel-based FDR.
* Default is False.
* ThresholdInputSpecs checks if the input for this parameter contradicts the input made for FWE because you cannot have both FWE and voxel-based FDR correction.
* If conflicting inputs are found, it raises a ValueError.

I hope you will find these changes useful as well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdfe679a49f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.