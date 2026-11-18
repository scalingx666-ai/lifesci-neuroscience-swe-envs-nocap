# Issue

**Title:** Ability to specify which series to convert

## Description

This PR proposes a small feature addition to the `dcm2niix` command line interface, which allows the user to specify one or more DICOM data series that they wish to convert. 

My interest is in GUI development and data visualisation, so I would like to use `dcm2niix` in the following way:

1. Identify the DICOM series that are present, by only outputting BIDS sidecar `.json` files:
   `dcm2niix -b o ...`

2. Prompt the user to select which data series they wish to view.

3. Convert those series from DICOM to NIFTI, using the proposed `-n` command line flag. For example, if the user only wishes to convert series 2 and 4, they would type:
   `dcm2niix -n 2 -n 4 ...`

I am proposing this feature purely from a performance point of view - by limiting which series get converted, computational time, memory, and hard disk usage can all be kept down to only what is necessary.

I figured that, in the event that multiple DICOM series with the same series number are present, `dcm2niix`'s present behaviour of appending an alphabetical suffix to the series number in the generated file names would be acceptable.

However, I am not particularly tied to use of the series number, so feel free to propose an alternate method of identifying which series to be converted!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e35a1f1bf321`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.