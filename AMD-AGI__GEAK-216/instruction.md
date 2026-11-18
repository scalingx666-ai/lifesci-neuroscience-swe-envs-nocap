# Issue

**Title:** support multi-gpu usage and minor fixs

## Description

Add group GPU support for homogenous mode and fix task task_parse for long kernel name. 

The group GPU is to have multiple GPU available for single work thread when num parallel < GPU numbers.
i.e. parallel= 1, HIP_VISIBLE_DEVICES=0,1,2,3
4 GPU will all be available for the agent. 

Task_parse is to cut long GPU kernel name to less than 20 chars, prevent Path lib error.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ed221cc1f6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.