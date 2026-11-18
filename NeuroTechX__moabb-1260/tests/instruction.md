# Issue

**Title:** Fix Rozado2015 channel mapping and microvolt scaling

## Description

### Fix Rozado2015 channel mapping and microvolt scaling (#1070)

Channel 0 of the 57-channel BioSemi XDF stream is Trig1. The loader took
the first 32 channels by position, so Fp1 held the trigger, every other
label was shifted by one electrode and Cz was dropped. It also scaled the
stream's declared microvolts as raw ADC counts (31.25e-9 instead of 1e-6),
making the EEG 32 times too small. Pick the scalp channels by label,
check the declared unit and scale microvolts to volts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42b263b6940d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.