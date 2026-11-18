# Issue

**Title:** Data buffering issue

## Description

# Overview

Restructured the `lsl_client` to pull data from LSL for querying in a way that ensures the latest data is available in the buffer for querying.

## Ticket

https://www.pivotaltracker.com/story/show/186539529

## Contributions

- Additional logging in lsl_client to better track what's happening during data pulls.
- Increased buffer size of the LSL StreamInlet so it would not lose data during long pauses (app startup; after letter selection; etc).

## Test

- Ran Copy Phrase task and analyzed logs to ensure that sufficient data was queried to make a decision.

## Discussion

According to the LSL docs (https://labstreaminglayer.readthedocs.io/info/faqs.html), setting the `max_buflen` on a `StreamInlet` should ensure that it keeps only that amount of data (in seconds) and discards the rest. We were relying on this functionality to get data for a decision. However, in recent versions of LSL it seems to sometimes be discarding too much data. This seems to occur after long pauses. When we queried for the latest (2400 records), we would sometimes only get 200-300. I'm still working on creating a minimal example to replicate this problem.

Note also that I am still getting application crashes (Segmentation fault) if the application sits too long on the opening screen or if a task is paused for a while. I'm not sure what's causing this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `928944a52fd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.