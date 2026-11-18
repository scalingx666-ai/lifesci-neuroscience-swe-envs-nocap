# Issue

**Title:** FF: Handle when system locale isn't detectable

## Description

Mostly `locale.getdefaultlocale` should always give something meaningful, but on some computers (@RebeccaHirst 's macbook for some reason) it returns `None`. In these cases, it's not really possible to detect the system locale, so we shouldlog a warning and fallback to US English rather than failing altogether

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7acc9de18762`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.