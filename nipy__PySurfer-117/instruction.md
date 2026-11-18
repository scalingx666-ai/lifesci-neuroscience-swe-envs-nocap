# Issue

**Title:** allow codec to be none for old versions of ffmpeg

## Description

The save_movie() function calls ffmpeg with the -c argument which breaks very old versions of ffmpeg such as versions which can be found on old installations of RHEL/CentOS. This PR allows the omission of the -c argument when the codec kwarg is None.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7373bd418d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.