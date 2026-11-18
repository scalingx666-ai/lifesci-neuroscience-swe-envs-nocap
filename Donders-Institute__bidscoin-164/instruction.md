# Issue

**Title:** Pet2bids (dicom only)

## Description

The goals of this PR are very minimal:

- [x] Configure bidscoin such that if the pet2bids plugin is installed use it for PET files instead of anything else
- [x] Convert only dicom PET files at the moment (it's easy enough to update the plugin to target ecat and xlsx after the fact)
- [x] Minimally modify any code outside of the plugin 
- [x] It should be noted that I did start this before bidscoin was using pytest so I need to refactor some of my tests to pytest instead

- More than happy to take up best BIDSCoin practices and modify to suite; at the moment I'm just tickled that this creates a bidsmap in the manner I intended.

- [x] Pass metadata from bidsmap to output from pet2bids (currently it gets lost in translation)
- [x] Update pet2bids to output the whole file name as destination, it's own logic is only extracting the `sub-` and `ses-` name from the target provided by bidscoin.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75f55d9ce002`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.