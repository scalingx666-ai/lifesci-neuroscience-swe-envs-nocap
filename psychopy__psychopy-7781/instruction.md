# Issue

**Title:** NF: Added PyAV and OpenCV support to `MovieStim`

## Description

Added support for PyAV and OpenCV as video decoder backend options to `MovieStim`. Added comprehensive tests for movie playback for all backends including FFPyPlayer. When using Python 3.14+, the default decoder library is set to PyAV, earlier versions will use still FFPyPlayer. To force PyAV on <3.14, I added `setBackend()` functions to the pubic API of the `MovieStim` library so the user can set it accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1520a38b7cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.