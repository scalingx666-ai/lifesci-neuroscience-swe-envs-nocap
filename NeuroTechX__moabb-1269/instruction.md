# Issue

**Title:** Fix Zhou2020 S-subject channel names and layout

## Description

### Fix Zhou2020 S-subject channel names and layout (#1120)

S-subjects (1-12) loaded as EEG1..EEG41 without montage, taking the first 41
of the 45 data columns as EEG: hEOG/vEOG and the M1/M2 mastoids were served
as EEG and POz, PO4, Oz and F6 were dropped.

The NPZ files carry no names; the authors' readme_MIdataset.docx (Table 1,
Fig. 2) and MI_dataset.py on the original IEEE DataPort deposit
(doi:10.21227/f1c7-7x89) do: columns 0-25 are the 26 channels shared with the
A-subjects, 26-27 hEOG/vEOG, 28-29 M1/M2 (dropped by MI_dataset.py, omitted
from Table 1) and 30-44 F5, AF3, AF4, P5-P6, PO3, POz, PO4, Oz, F6. The
placement was checked on S01/S05 against the signal correlation structure.

Both cohorts now get real names and colin27_1005; hEOG/vEOG (eog) and M1/M2
(misc) are loaded with return_all_modalities. Synthetic regression test.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c847bd539a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.