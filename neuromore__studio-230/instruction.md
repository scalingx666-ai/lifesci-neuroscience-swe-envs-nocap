# Issue

**Title:** Fix CSV Reader and fix some first zero case

## Description

* Stop adding `0.0` if no last sample is available in `DoOutputLast()` in `ResampleProcessor.cpp`. Instead skip until a last sample is available (e.g. next tick).
* Also call `SetSampleRate()` for Input Port in `Sensor.cpp` as this is evaluated by `ResampleProcessor` and by default leads to DoOutputLast() if not set (and to resampling if not set identically)
  * This fixes CSV values not correctly read (a single one was repeated many times)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `857e28d1a7e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.