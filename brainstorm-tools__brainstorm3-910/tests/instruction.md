# Issue

**Title:** Headmodel: Allow to display NIRS volume head model

## Description

I recently started playing with volumetric nirs head models: https://github.com/Edouard2laire/nirs-dpf/blob/main/process/process_compute_head_model_volume.m 


This PR allows to visualize the resulting head model in Brainstorm. It's actually very nice that the visualization automatically works well without adjustment. 


For example here, using the isosurface that show the 'famous' banana shape: 
<img width="1103" height="861" alt="image" src="https://github.com/user-attachments/assets/25cc05c1-8987-45e7-858a-ce9aeecdfe71" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ca877612ecb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.