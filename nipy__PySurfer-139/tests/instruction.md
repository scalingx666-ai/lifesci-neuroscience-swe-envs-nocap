# Issue

**Title:** Allow brain without x offset

## Description

The automatic offset creates a problem with my program which uses the vertex coordinates for a complicated algorithm to snap subcortical locations to optimally selected surface vertices and then plots the results. Easiest fix is to allow the user to disable this feature.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7faeabcdb8a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.