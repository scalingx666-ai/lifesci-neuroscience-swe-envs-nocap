# Issue

**Title:** Changing file size detection to support symlinks

## Description

Matlab's dir command returns the number of bytes of the symlink itself rather than the link target. If a raw data file is processed by Kilosort2 via a symlink, `get_file_size` returns the correct file size by using the `stat` command. On Windows, dir continues to be used (I'm not sure what happens if someone on Windows uses mklink).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5acff9fc49df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.