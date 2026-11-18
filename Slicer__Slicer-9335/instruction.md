# Issue

**Title:** BUG: Apply slice intersection thickness to planar contour points in 2D

## Description

Planar contour segment representations have VERTEX cells using PointSize, not LineWidth, so the "Slice intersection thickness" setting (which only set LineWidth) had no visible effect for this representation, unlike closed surface or ribbon.

<img width="1715" height="1091" alt="image" src="https://github.com/user-attachments/assets/aa7e22e1-ccaa-47e1-b4f2-02852e82a338" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a81a83f7724`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.