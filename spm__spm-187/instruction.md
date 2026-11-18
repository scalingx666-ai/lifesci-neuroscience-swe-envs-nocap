# Issue

**Title:** Fix false FieldTrip MEX warning in spm_check_installation

## Description

The FieldTrip MEX check added external/fieldtrip to the path and then called ft_getopt, but ft_getopt lives in external/fieldtrip/utilities, which is only added to the path by ft_defaults. On a fresh MATLAB session the test call therefore failed with "Undefined function 'ft_getopt'" and the check reported a spurious MEX incompatibility warning.

Add the utilities folder alongside the FieldTrip root for the duration of the check, and remove both afterwards.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e20125ba3ff6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.