# Issue

**Title:** [datetime] Improve I/O support for time of acquisition

## Description

This PR is here add support for datetime information from various files : 


** EDF** 

- Import/export date from the file
- Improve performance to find the max of the file (use larger block size than 1 seconds)



For the performance, exporting a 2-hour file (34 channels at 250Hz) reduced the time to find the max values from 24 seconds to 1 second. (nblock is decreasing from 7681 to 5)


** SNIRF** 
- modify the reader / writter to support datetime information (according to snirf standard)


** BIDS **
- Read from scan.tsv

 ** FIF **

Read from the file. Note, i tried on a file from https://openneuro.org/datasets/ds000117/versions/1.1.0  but i find the following acquisition date: '1941-56-26'T'09:04:09' i don't think it's right but it make sense based on the information in the file.  I guess the date is wrong but time is ok ? not sure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `572d9d470a89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.