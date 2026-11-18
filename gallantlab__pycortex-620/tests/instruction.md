# Issue

**Title:** FIX typo that caused webgl shaders not to be set

## Description

# Problem
When displaying long movie volumes, voxels can sometimes appear to "drop out". Only the voxel boundaries would be rendered, and the rest of the surface would remain blank. This seemed to only happen after the first few frames of the video (between 8 and 30 with Firefox my laptop, low 100s for the headless viewer). It is not the effect of rendering partially loaded volumes -- this happens even after letting the browser "rest" for several minutes before interacting with the viewer.

# Solution
The typo meant that `magFilter` was not set (only `minFilter` was) for all volumes loaded some time after the page was loaded.

Before fixing the typo:
<img width="1246" height="777" alt="image" src="https://github.com/user-attachments/assets/3f0e02d2-df5d-4e10-ae2a-25b4b75c5e95" />

After (expected):
<img width="1252" height="789" alt="image" src="https://github.com/user-attachments/assets/79be3ec3-cc34-486e-8f79-d8a05c866330" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37969e0755d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.