# Issue

**Title:** Fixed the crash on save.

## Description

Issues:  
 There were two problems in the flow both caused by the fact that  some actions of file cleanup/close are done after write backend some before that, and they were not synchronized:
 
  - OpenClassifier closes the file,  in the reply handling setUndirty is called on the same file. 
  - openGraph unloads the graph,  setUndirty is called in reply. 

Fixed by adding 'wait' mechanism to reply and put the file resource handling in appropriate places.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6aaf1a2ecca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.