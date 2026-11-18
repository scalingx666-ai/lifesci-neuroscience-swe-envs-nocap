# Issue

**Title:** Change setpaths to not download submodules by default. Use 'init' or 'update' options to download automatically.

## Description

-- Change setpaths to not download submodules by default. Use 'init' or 'update' options to download automatically. If using github desktop then github desktop download submodules automatically.
-- Change downloadSharedLibs to change .gitmodules origin url to point to where ever parent came from
-- Add .gitattributes to exclude files from branch merges such as submodule references and .gitmodules
-- Sync getVernum with Homre3. (getVernum will eventually be moved to Utils/Shared library)
-- Improve creation of installation file and installation process using myCopyFile.m

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1d9273e4d7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.