# Issue

**Title:** Fix Compumedics ProFusion event import: labels and marker timing

## Description

- Use EventString for event labels instead of raw EventTypeID, which collapsed distinct annotations into one meaningless category

- Decode StartSecondHi/StartSecondLo as a 64-bit nanosecond tick counter anchored to the study's creation_time, previously misread as a plain seconds value

- Decode DurationHi/DurationHi as a 64-bit nanosecond tick counter for extended events

- Filter events to the loaded .rda segment's time window; the database stores events for the entire multi-day study, so markers from unrelated segments were leaking in

- Add correct recording start time `t0` for each `.rda` file

Validated against ProFusion's own display labels and marker timing; now match exactly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9ccf1c17079`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.