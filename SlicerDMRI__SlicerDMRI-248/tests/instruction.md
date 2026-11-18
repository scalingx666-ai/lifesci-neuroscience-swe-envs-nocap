# Issue

**Title:** FIX: Switch to using ghost cell array for subsampling

## Description

Using the vtkSelection and vtkExtractSelection methods meant that every change in the subsampling ratio led to a new polydata being created, which generated an event that caused the ctk combo box to update the list.  This caused it to set the value to None, and that in turn triggered another update of the selection extraction and eventually there would be a crash due to recursion.

This change extracts the subsample of cells first and then assigns the attributes so that the output polydata arrays do not change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fbd9f37d311`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.