# Issue

**Title:** Fixed bug for work dirs longer than 255 characters, fixes #2061

## Description

## Summary

This change is fully backwards compatible and will
not affect existing pipelines, but it will prevent
the pipeline engine from crashing when some parameters
are long and it was trying to create subdirectories
longer than 255 characters (a typical unix limit).

 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff8e514be7f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.