# Issue

**Title:** Separate NWB reading from extractor construction

## Description

I am planning to fix the following open issues:

- 
- 
- 

Before doing so I want to do a refactor. The nwb reading logic (three formats, two streaming modes) is currently tangled with the extractor construction logic for all three extractors (recording, sorting, time-series), so a fix in reading requires finding and changing multiple duplicated sites. This PR separates those two concerns so I can do a centralized fix.

This will fix #2910

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `864003056b68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.