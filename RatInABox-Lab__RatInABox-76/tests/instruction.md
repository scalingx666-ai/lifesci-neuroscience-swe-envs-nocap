# Issue

**Title:** Vector cells

## Description

This branch addresses the issue discussed in #71 . 

This has the following changes:- 
- Introducing a new class called Vector Class. OVCs/BVCs will be child classes of this class.
    - Using this class the user can now have any custom manifold if they so choose (in a specific API)
    - extends the display manifolds functionality of FoV to all types of Vector Cells (allocentric and egocentric)
    - Solved some bugs related to display_manifolds
    - Now the default manifold maps  are a part of the utils. Also have the 'hartley'/'uniform'/'random' manifolds

A small caveat for the OVCs. Now instead of being randomly assigned to objects. Now one can passed a preferred object type

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e71681ab799e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.