# Issue

**Title:** Teach write.neuron(s) to put metadata in SWC header

## Description

* this could be supported for other formats
* maybe it would be better not to convert to JSON immediately in 
  write.neuron since other file formats might want store metadata 
  differently
* note that we convert data.frame->list so that we dont have a 
  list wrapper around the json

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a66a1df14c59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.