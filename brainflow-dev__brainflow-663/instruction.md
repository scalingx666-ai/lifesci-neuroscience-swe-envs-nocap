# Issue

**Title:** Add log message for EOF in PlaybackFileBoard.

## Description

BrainFlow's stream doesn't block, so, the user calling into the session has to use some other method - sleeping, or waiting for user input before terminating the session.

When playing back a file, and not looping, it's possible the file will ned before the user is expecting. At this point, the file reader will sleep, but no message is printed, so the pipeline silently stops sending values.

This simply adds a logging line for when the file playback virtual board has reached the end of file and stops producing data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dbd69d4d021`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.