# Issue

**Title:** ENH:  Coordinate default params across ANTsX packages.

## Description

``m_UseMaskedSmoothing`` is [turned off](https://github.com/ANTsX/ANTs/blob/master/Utilities/itkDiReCTImageFilter.hxx#L66) by default.  [The parameter is not set in ANTsPy](https://github.com/ANTsX/ANTsPy/blob/master/ants/segmentation/kelly_kapowski.py#L11-L37).  Since the 2014, 2019, and 2021 evaluations all used either the ANTs or ANTsPy version, I'm changing the ANTsR parameter set to be consistent with the other two.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1dec33aa1611`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.