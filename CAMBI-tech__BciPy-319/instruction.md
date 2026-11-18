# Issue

**Title:** Added new sampler to sample an Inquiry at a time

## Description

# Overview

Created a new Sampler for the Simulator to use an Inquiry at  a time.

## Ticket

https://www.pivotaltracker.com/story/show/187262169

## Contributions

- Created a new sampler to test our architecture for changing sampling strategies.
- Added a new logging utility to help with logging DataFrames.

## Test

- Ran the simulator using the new sampler. Inspected the log files to confirm that for each simulated inquiry, all of the EEG likelihoods were coming from the same source Inquiry. Also confirmed that the source was different for each simulated query. This works for both inquiries with a target and those without.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb9349472236`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.