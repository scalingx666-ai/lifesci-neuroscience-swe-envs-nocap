# Issue

**Title:** v1.76.0  -- Update DataTree shared lib submodule

## Description

v1.76.0

-- Update DataTree shared lib submodule

* DataTree, 1.12.0
-- Change AcqDataClass GetSrcPos and GetDetPos methods to ignore '2D' and instead automatically try to retrieve 3D optodes if available otherwise it retrieves 2D. This fixes the problem of retrieving non existent or artificially generated 2D optodes that do not agree with the 'LengthUnit' which is a problem when doing image reconstruction and using a non-zero SD separation to exclude channels (possibbly end up exluding ALL chaqnnels if units apply to the wrong optodes).
-- Update NirsClass so SDgui matches GrommetRot being changed back to cell array type instead of numeric array.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4974adb8ee3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.