# Issue

**Title:** FIX: scans.tsv: resolve the timestamp timezone from the historical date if you can

## Description

- When parsing a timezone-naive timestamp from a `scans.tsv` file, by default we try to attach the computers local timezone, but using the timezone rules for ~that date~ the date of the timestamp (this was the behavior prior to  )

- But if we hit this Windows platform pre-epoch timestamp error, then we fallback to just attaching the computers *current* timezone to the timestamp (even though this might be incorrect sometimes).

@larsoner @drammock once the CI's are green can I ask one of you to take a close look at this?

This one was tricky because the pre-epoch datetime test had the same problematic behavior as the function we were patching (i.e., it queried the computer to get the current local timezone information). In order to make the test more deterministic I had to do some monkey patching...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30330ad36741`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.