# Issue

**Title:** HBP-184: Create an YML template file that generates a backup cronjob in OKD

## Description

- Have a separate YML file (than the one creating the TVB image initially) as we might want to edit this job
  - edit of the CronJob we found how to do only with the YML file, using the same name 
- We want to have a DB backup in EBRAINS OKD for the official TVB images
- maybe run it every weekend (to not propagate immediately a mistake) as the backup is not incremental

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ea3ca3cb401`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.