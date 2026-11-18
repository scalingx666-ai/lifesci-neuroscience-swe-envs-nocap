# Issue

**Title:** NEW: logging of inter-event-intervalls

## Description

I find this a very handy method to check the time of your experiment.

Eventfile.log has an optional log_event_tag for the logging of inter-event-intervalls. If this is defined a summary of the intervalls will be added to the event file.  All present methods have an optional log_event_tag that will be passed to Eventfile.log (see above).

@fladd  What do you think?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd2e1944050b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.