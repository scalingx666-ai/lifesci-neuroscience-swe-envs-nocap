# Issue

**Title:** Session Metrics

## Description

# Overview

This PR includes additional metrics to the session data output by the system to allow investigators to more accurately assess user performance.

## Tickets

* [Consistent Session Metrics](https://www.pivotaltracker.com/story/show/179649835)
* [Custom session metrics for Copy Phrase and Inquiry Preview](https://www.pivotaltracker.com/story/show/179806994)

## Contributions

- Added calculated values to Session data that compute some overall metrics.
- Added optional field in the Session data for `task_summary` data.
- Added custom metrics for the Copy Phrase / Inquiry preview tasks.

## Test

- Created additional unit tests and ran them.
- Ran the Copy Phrase task and inspected the resulting session.json data to ensure that values are being correctly calculated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82d3a48db935`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.