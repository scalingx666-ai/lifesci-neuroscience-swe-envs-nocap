# Issue

**Title:** New ParallelPort module

## Description

Entirely new implementation, based on PsychoPy code!

Much more advanced than the old one. 5 status lines can be read now, and also all 8 data pins are readable!
I created a combined (13 pin) polling method for usage as port interface (e.g. in TriggerInput).

However, reading data is still untested! I do not have access to any device that sends data to the data pins. @lindemann09 do you?

Any comments are very welcome.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09c5579e4d3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.