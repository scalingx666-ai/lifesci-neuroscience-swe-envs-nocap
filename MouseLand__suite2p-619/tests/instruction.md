# Issue

**Title:** Use the sbxreader to load scanbox files

## Description

Hi, 
I separated the reader into a new package sbxreader (on pip). https://github.com/jcouto/sbxreader

This reads both old and recent sbx files. New files were not working because the structure of the matfile for the ETL values changed.

Moving it to a separate package allows simple code review and independent testing. I plan adding mesoscope parsing capabilities to this in the future if there is demand.

Changed the default value of  sbx_ndeadcols to 0 because this depends on the plane and if done by default will discard useful data.

You can find a test dataset here: https://drive.google.com/drive/folders/1mIF8_-Wcx0J8n6ENANNBGyqYgyulssuI?usp=sharing

Please let me know your thoughts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3eeb5ccd1235`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.