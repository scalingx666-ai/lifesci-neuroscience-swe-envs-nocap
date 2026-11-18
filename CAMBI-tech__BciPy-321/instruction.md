# Issue

**Title:** Pause error

## Description

# Overview

- Fixed an issue where BciPy would crash after a long pause. 
- Fixed a bug with segfaults when running BciPy on Macs.

## Ticket

https://www.pivotaltracker.com/story/show/187261791

## Contributions

- Refactored the acquisition module to use multiprocessing, rather than threading (see discussion below). 
- Added a configuration for the max number of seconds allowed for pausing.
- UI handling to end a task after a max pause duration has been reached.

## Discussion

### Segfault issue

The LSL library has methods which must be run on the main thread of execution on linux/Mac computers. Running them in a separate thread was causing segfaults to occur. By refactoring to use multiprocessing, each of the objects that use LSL are essentially acting as the main thread, which resolves this issue. Note that we should do a timing test to confirm that the static offsets are still the same.

### Pause bug

Previously we calculated the max buffer for LSL based on the maximum possible duration of an inquiry. However, we did not account for pause length. I was making the assumption that the LSL buffer would continue to accumulate data and only retain the latest (like what would happen in a ring buffer data structure). However, LSL has undefined behavior when the StreamInlet `max_buflen` is exceeded. When you attempt to retrieve data after this maximum is exceeded some of the data is missing and what is returned may not even be in monotonic order. I was able to replicate this behavior without using BciPy in the `lsl_buffer_test.py` script. This script will allow us to test future versions of LSL in case we want to change our approach. Currently, the resolution is to set a fixed maximum buffer size in the configuration that accounts for the maximum amount of time we may want to pause during a session. If this is exceeded the task gracefully shuts down.

## Test

- Ran a calibration task and paused on the wait screen (before starting the task) for different durations to confirm the behavior is correct.
- Ran the calibration task and paused after one or more inquiries. Confirmed that the task was able to resume if the wait time was less than the configured max.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efc21bba2984`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.