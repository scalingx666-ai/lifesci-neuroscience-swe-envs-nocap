# Issue

**Title:** Stimulus.stimulusWaveformFromFile: Cache ATF/ABF objects

## Description

Especially ATF files need a considerable amount of time for parsing and
reading, file sizes of 20MB (CSV text files) are quite common.

In order to avoid this overhead if we have alrady done it, we now cache
ATF/ABF objects in the class variable Stimulus.waveformCache.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e847895c59b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.