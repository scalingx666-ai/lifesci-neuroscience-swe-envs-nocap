# Issue

**Title:** EBR-63 slider bug

## Description

After a recent upgrade to matplotlib the PhasePlaneInterractive is no longer working correctly.
The Sliderul from matplotlib widgets, in old versions was built with Polygon, and now it is with Rectangle.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd98b32ad95b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.