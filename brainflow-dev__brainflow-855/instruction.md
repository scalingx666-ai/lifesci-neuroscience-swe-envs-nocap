# Issue

**Title:** Fix Muse S Athena EEG scale factor

## Description

## Summary

- change the Muse S Athena EEG scale from `0.40293040293040294` to `1450 / 16383` µV/count, matching the published 1.45 mVpp range and 14-bit samples

This addresses the scale-factor part of #854. It intentionally keeps the existing unsigned/DC-offset representation unchanged; midpoint handling can be considered separately without coupling another baseline behavior change to this correction.

Athena EEG values are now 4.552557787× smaller than values produced by the previous scale.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9d9c1f17f96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.