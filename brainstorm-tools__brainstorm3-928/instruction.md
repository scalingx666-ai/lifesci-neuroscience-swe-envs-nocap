# Issue

**Title:** Modifications to display row table names

## Description

Hello, 

i'm currently working with @Edouard2laire in Christophe Grova's Lab. I've been facing issues on saving metric results as tables : https://neuroimage.usc.edu/forums/t/issue-with-tables/57522 

This code has been done in order to improve the visualization of tables in Brainstorm : 
1) Row names are now displayed in brainstorm (view_matrix.m file : sMatRaw.RowNames)
2) The width of each column is set to the largest element of the column (view_table.m file)

Thanks a lot, 
Jean-Eudes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22e15f809d02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.