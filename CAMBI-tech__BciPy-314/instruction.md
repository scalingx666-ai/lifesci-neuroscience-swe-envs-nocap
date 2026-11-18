# Issue

**Title:** Add Data Source

## Description

# Overview

Added the data source to the sampled trial data to allow us to confirm that the sampled likelihoods match the values in the session data.

## Contributions

- Created a named tuple for storing Trial data; documented the fields.
- Refactored data engine to simplify the needed data processing by moving some of this to computed fields in the ExtractedExperimentData class

## Test

- Ran the simulator and spot checked that the sampled values in the log matched the EEG likelihoods in the corresponding session.xlsx file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a03cad1d7d41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.