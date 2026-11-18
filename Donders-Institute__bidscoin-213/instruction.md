# Issue

**Title:** Fix dynamic <<>> runindex

## Description

Adding run-1 to files immediately when new run is detected introduces problems:

1. dcm2niix2bids: variable jsonfiles
Need to remove run-less file and add run-1 file

2. dcm2niix2bids: newbidsname via dcm2niix postfixes
- If bidsname changes via postfixes, run-index starts from the one that was already in old bidsname, although this new bidsname could be unique and therefore doesn’t need run-index. Function increment_runindex would need to check for that.
- If bidsname changes from run-less to run-2 via dcm2niix postfix in the same dcm2niix plugin run, again, need to remove run-less file and add run-1 file to jsonfiles. If it is the other way around, so from run-2 to run-less (after increment_runindex is adjusted for the case if bidsname contains run-index although it doesn’t need it), previously added run-1 with increment_runindex needs to be removed because it is no longer valid. This needs to be reflected in scans_table and in jsonfiles again.

I think this solution is not well maintainable since one needs to rely on the concrete order of functions called and increment_runindex is not standing on its own, since we need to later fix renamed files. With dcm2niix postfixes, files are being renamed back and forth, when run-1 is not needed in the first place, although we do not know it at the time of naming. Also, if in the future files are collected in new variables, these changes need to be reflected in all the variables and it is easy to forget to do that.

I suggest adding run-1 to files that need it (run-2 exists) and use <<>> run-index at the end of the plugin run, since at that time all the names of files are final and dcm2niix postfixes won’t change them. It also removes side effect from increment_runindex and makes it simpler.

I merged this fix with other suggestion I have: generate .tsv file with information what source was mapped to what bids files. I know that one can see in logs what was mapped to what, but having tsv file means one can quickly check the final names and that mappings are correct. We can see how the result mappings would look like also from bidsmap, but run-indexes and changes via dcm2niix postfixes are not there.
Maybe in the future, user could define what run data would he like to add as new column for easier check of mappings, for now I added SeriesDescription since a lot of files are mapped by that.

This bids_mappings.tsv file looks for example like this:
| subject | SeriesDescription         | source                                              | BIDS_mapping                                           |
|---------|--------------------------|-----------------------------------------------|----------------------------------------------|
| sub-01  | AAHead_Scout            | sub-01/std1_01_AAHead_Scout                 | X                                                |
| sub-01  | localizer                       | sub-01/std1_02_localizer                           | X                                            |
| sub-01  | t1_mprage_sag            | sub-01/std1_03_t1_mprage_sag                | anat/sub-01_T1w.nii.gz                       |
| sub-01  | bold_25iso_tr800-rest  | sub-01/std1_04_bold_25iso_tr800-rest     | func/sub-01_task-bold25isotr800rest_echo-1_bold.nii.gz |
| sub-01  | bold_25iso_tr800-rest  | sub-01/std1_04_bold_25iso_tr800-rest     | func/sub-01_task-bold25isotr800rest_echo-2_bold.nii.gz |
| sub-01  | bold_25iso_tr800-rest  | sub-01/std1_05_bold_25iso_tr800-rest     | func/sub-01_task-bold25isotr800rest_echo-1_part-phase_bold |
| sub-01  | bold_25iso_tr800-rest  | sub-01/std1_05_bold_25iso_tr800-rest     | func/sub-01_task-bold25isotr800rest_echo-2_part-phase_bold |
| sub-01  | bold_gre_map             | sub-01/std1_06_bold_gre_map                  | fmap/sub-01_magnitude1.nii.gz                |
| sub-01  | bold_gre_map             | sub-01/std1_06_bold_gre_map                  | fmap/sub-01_magnitude2.nii.gz                |
| sub-01  | bold_gre_map             | sub-01/std1_07_bold_gre_map                  | fmap/sub-01_phasediff.nii.gz                 |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `898fa0f1f99b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.