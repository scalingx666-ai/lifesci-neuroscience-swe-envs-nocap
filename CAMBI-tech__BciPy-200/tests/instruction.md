# Issue

**Title:** Fix inquiry reshaper

## Description

# Overview

Fix `InquiryReshaper` to use the correct window of time for each inquiry.

Sidenote - this now returns data with shape `(inquiries, channels, samples)`.
The point of using this is to get data to feed into neural net for classifying entire inquiries, and that will expect to have batch dimension in front.
If it is preferred to be more consistent with `TrialReshaper` (which returns shape `(channels, trials, samples)`), we could adjust this PR (but future code will have to do
`data.transpose([1,0,2])`).

## Ticket

https://www.pivotaltracker.com/story/show/181349027

## Contributions

- Change how the time for an inquiry is calculated

## Test

- Updated the unit test for InquiryReshaper

## Documentation

- Docstring updated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a48180ca83d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.