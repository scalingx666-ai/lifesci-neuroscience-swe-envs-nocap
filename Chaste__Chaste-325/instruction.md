# Issue

**Title:** #324 Simplify monitoring of potential VTK fix backport

## Description

and #324 

Simplify out nightly check: let us know if the version of VTK that gets installed ever changes.

This will allow us to update the Ubuntu 22.04 package to pull in a patched vtk, without interrupting our monitoring of a potential fix from Ubuntu.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4e357178db8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.