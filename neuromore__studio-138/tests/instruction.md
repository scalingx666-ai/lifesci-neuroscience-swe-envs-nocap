# Issue

**Title:** Fixed EDF export, added proper file closing on stop.

## Description

Changes: 
  - Added mHandle as edf file handler ("FileWriterNode").
  - The logic for opening and setting an EDF file has been moved from "ChannelFileWriter" to "FileWriterNode".
  - Added logic to close the files when the "Stop" button is clicked.

Testing: 
  There could be an issue with channel min/max (as discussed), for proper testing change it in the code. 
FileWriterNode.cpp : 236 ,  in  `df_set_physical_maximum(handle, i, mWriteChannels[i]->GetMaxValue())` , pass some value (>0) instead of mWriteChannels[i]->GetMaxValue(). 

Fixes:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c209cdf93db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.