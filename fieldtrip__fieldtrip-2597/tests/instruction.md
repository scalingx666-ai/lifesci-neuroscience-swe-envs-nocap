# Issue

**Title:** ENH - use neuromag logic for creation of coordsystem.json fieldline data

## Description

Im an working on data2bids conversion of fieldline data, where those data have been 'postprocessed' by the HEDScan software, and thus coregistered to HPI-coils. Thus the fif-file contains digitization points + is defined in neuromag coordinates. This PR adds some logic so that data2bids tries to automagically create the <>_coordsystem.json for FieldLine fif-data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad7999b5310f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.