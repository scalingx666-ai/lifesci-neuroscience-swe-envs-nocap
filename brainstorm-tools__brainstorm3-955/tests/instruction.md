# Issue

**Title:** Allow to compute volumetric head model for nirs

## Description

This PR is the follow-up to  and my work in https://github.com/Edouard2laire/nirs-dpf/blob/main/process/process_compute_head_model_volume.m

First, it improve the check for nirs, ensuring that all the optodes are on the scalp. 

Then this allows importing a volumetric nirs head model into Brainstorm.   is the corresponding PR in NIRSTORM.


The only issue is that the entire head model doesn't seem to be displayed. Here I used an isometric grid covering the entire head, but when displaying it, it seems to filter only the dipoles near the cortex; 
<img width="1439" height="764" alt="image" src="https://github.com/user-attachments/assets/1ff2dfeb-2b97-45ef-80c3-26deeef9f489" />


If I indicate the head as cortex, then i see all of them: 

<img width="1439" height="764" alt="image" src="https://github.com/user-attachments/assets/ba3a7c0f-bb30-4c3b-b4bb-370e402c0800" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31b3c04ba4e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.