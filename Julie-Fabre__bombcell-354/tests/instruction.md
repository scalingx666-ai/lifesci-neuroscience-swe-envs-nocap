# Issue

**Title:** Plotting bugs

## Description

This pull request fixes a few bugs I found in the logic for generating waveform overlays. 

All bugs were encountered when setting param['splitGoodAndMua_NonSomatic'] was set to True. 

- The first bug caused only 4 out of 5 waveform overlay subplots to display in the notebook. 
- Once this was fixed, another bug manifested that caused the axes and tick-marks to appear in the empty 6th subplot. 
- The third bug was caused by improper indentation of a chunk of code in generate_waveform_overlay() - this prevented the plotting code from actually getting executed when param['splitGoodAndMua_NonSomatic'] was set to True.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce21723e821f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.