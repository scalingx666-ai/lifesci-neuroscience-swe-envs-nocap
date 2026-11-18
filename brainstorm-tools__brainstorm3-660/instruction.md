# Issue

**Title:** Synchronise multiple signal

## Description

Hello, 

This process aims at aligning multiple signals acquired with different devices but sharing synchronizing events (typically sent to each recording device at the time of the acquisition).  This situation can arise easily when recording multimodal data such as EEG - iEEG,  EEG - fMRI, fNIRS - fMRI, or EEG - fMRI. 

Having the signal synchronised makes making easier to perform multimodal analysis, notably allowing the simultaneous exploration of the different signals. For example, here is a figure I recently presented at a conference, showing how we can understand better what is happening during a seizure by looking at the EEG, fNIRS, and pulse oximeter 

![image](https://github.com/brainstorm-tools/brainstorm3/assets/24530402/4dabaabc-ba6d-4095-ba1e-5cf122220a56)


What's left to do: 

- [x]  Fix the code to save continuous files as output 
- [x]  Improve file history


Future work 

Here is a list of future things we might consider implementing but that is not required for this PR

- [x]  Allowing the simultaneous visualization of the different signals from Brainstorm (#656)
- [x]  Explicitly linking the different synchronized files. This could notably be used so that if an event is added to a file, then the same event would be added to all the events the file is synchronized with. 
- [ ]  Add the option to either crop the longer signal  keeping only the common signal (current implementation) or pad the shorter signal with either 0 or NaN


Let me know if you want me to send you an example dataset. I can generate a minimum brainstorm database with 2 files to synchronize. 


Regards, 
Edouard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d8c21d6ea51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.