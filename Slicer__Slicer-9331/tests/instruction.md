# Issue

**Title:** ENH: Add option to report application startup timing

## Description

Add `--report-startup-timing` command-line argument, that writes application startup time measurements into the application log once startup is completed. This is useful for evaluating effectiveness of various startup time improvement mechanisms in different environments.

Measurements include time spent before main() function is called (the operating system loader loads libraries, Microsoft Defender malware scans, etc.).

Module instantiation and loading time is reported to help pinpointing modules that perform time-consuming operations at every startup.

Startup time could already be measured with the MeasureStartupTimes.py script, but that script is not bundled with the application, so it is not available to users of an installed Slicer and does not measure other important startup time components.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d01f90d3b050`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.