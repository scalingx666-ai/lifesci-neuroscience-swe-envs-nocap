# Issue

**Title:** Update compute_canada.rst

## Description

Singularity module is not available on Compute Canada anymore. Apptainer is used instead. 

Added resolution to minor error encountered while following instructions for pulling container (by default the required end point is missing on Compute Canada). 

Added reference to compute canada wiki on how to use Globus for file transfers

Summary: 
-Switched most mentions of "Signularity" to "Apptainer/Singularity" 
-Added instructions to resolve pull error 
-Added new option for data transfer

P.S. 
I am a student trying to use Miracl for a project. I am new to all of this and made my github account last night to share what worked for me. Please let me know if I am doing anything wrong and how I can fix it. Thank you.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35a66a35d417`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.