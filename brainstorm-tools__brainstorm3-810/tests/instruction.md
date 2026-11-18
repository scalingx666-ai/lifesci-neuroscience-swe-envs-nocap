# Issue

**Title:** Update EEG Channel Names when importing FIF/BIDS files from NeuroMag

## Description

This PR addresses issue 

When importing FIF files through `process_import_bids`, for non-MEG (here EEG) channels, two post processing steps are required:

1. Renaming the `EEGxxx` channel names to the proper ones as provided in the `_channels.tsv` file
2. Update the locations for the EEG channels from `_electrodes.tsv`. The reason we do this is because the locations in the FIF file may be not accurate but `_electrodes.tsv` will have the most accurate ones.

EDIT: These two post-processing steps are valid for any non-MEG channels.

Test Data: [SampleBIDS](https://urldefense.com/v3/__https://uthtmc-my.sharepoint.com/:f:/g/personal/k_michelle_patrick_uth_tmc_edu/EpWJ13V3IGFNkNaeV6rS2l4BWRzRo5pcVlUmRcCUh4wgnA?e=GdekgR__;!!LIr3w8kk_Xxm!pHyoJFc51dCUvOJEzzml2YEGTEWPMa4pBGQxmSUy6Jt24UoArJhz_u8N7xd3A0b78VXBICpXc_x_zngOOIZdu-9supKaOw$) (use only `sub-mci1022` for testing)

@kmpatkru @yashvakilna @tmedani

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dda527a69499`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.