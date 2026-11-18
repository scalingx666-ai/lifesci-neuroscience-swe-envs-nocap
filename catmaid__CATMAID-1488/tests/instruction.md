# Issue

**Title:** Stack Grid Viewer: Global zoom and recentre button

## Description

Two items of issue #1466.

1. Given each redraw has to address many stack viewers, I opted to just have a text box for the zoom - using a slider or spinner gets messy because of the performance.

2. I opted for a single recentre button for all of the mini stack viewers to share because they are starting to get cluttered, but can try to find space to put one in each if required.

Are these sufficient, @acardona ?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0e7205456b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.