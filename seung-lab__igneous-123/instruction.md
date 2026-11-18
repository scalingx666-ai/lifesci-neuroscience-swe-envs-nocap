# Issue

**Title:** redesign(cli): change --cseg and --compresso flags to --encoding

## Description

We offer wayyy more formats than just cseg and compresso (jpeg, raw, png, fpzip, kempressed, just to name a few). The user should be able to pick whatever they want.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f35feec4579b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.