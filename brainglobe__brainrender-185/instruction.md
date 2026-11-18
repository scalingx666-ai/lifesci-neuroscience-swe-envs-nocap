# Issue

**Title:** Solve transparency bug in linux

## Description

Hi Federico,
I had  a problem with the gui on linux that I thought depended on Pyqt5 being installed via conda, you can see the bug down here. All the meshes with an alpha different than 1 disappear. It turns out it is a vtk problem and the solution [here](https://stackoverflow.com/questions/51357630/vtk-rendering-not-working-as-expected-inside-pyqt) solves the problem.

Adding these two lines doesn't seem to change anything on my mac, didn't test it on windows though.
(the two lines has to be placed before the import of QVTKRenderWindowInteractor)
https://github.com/brainglobe/brainrender/blob/c9dc51383e9e9c49bf6c7277bb6d447b104a68ee/brainrender/gui/app.py#L6

https://user-images.githubusercontent.com/37729096/147964882-0b3671c6-a21e-4f21-bf45-5f9fdae409cf.mov

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9dc51383e9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.