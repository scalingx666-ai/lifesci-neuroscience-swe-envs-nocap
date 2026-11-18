# Issue

**Title:** Added geom_polygons

## Description

Added geom_polygons to draw arbitrary polygons on figures. Polygons are drawn prior to drawing data points to prevent polygons from covering up data. Example usage is included in comments of geom_polygon.m that is a modification of the gas mileage example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9883ac8f84d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.