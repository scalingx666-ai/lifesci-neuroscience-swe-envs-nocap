# Issue

**Title:** Remove hard limitation when using local memory init

## Description

When I tried to scan with big project, unfortunately this line as blocker even though I tried to use from `php -d memory_limit=-1`, rather than put hard limit, better use limit on artisan or set from the php.ini

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96c19a30d481`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.