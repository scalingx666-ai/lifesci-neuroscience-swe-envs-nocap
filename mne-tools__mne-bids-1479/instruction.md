# Issue

**Title:** make EDF writer handle anonymized meas_date

## Description

<!--
Thanks for contributing this pull request (PR).
If this is your first time, make sure to read
[CONTRIBUTING.md](https://github.com/mne-tools/mne-bids/blob/main/CONTRIBUTING.md)
-->

PR Description
--------------

EDF/BDF formats restrict the `startdate` (equivalent of meas_date) to be 1985-01-01 or later, which conflicts with the BIDS standard for anonymization (which requires anonymized dates to be before 1920-01-01). In #669 a decision was made to write EDF(+) files that violate the BIDS standard but honor the EDF standard (making them viewable in EDFBrowser), while writing the BIDS-compliant anonymized date in `scans.tsv`. However, it was only implemented in cases where the anonymized data started out in EDF format (i.e., only `mne_bids/copyfiles.py` was changed).  In cases where the data start in another format, are anonymized, and then written to EDF(+), the result will be an invalid EDF file. This PR fixes that.  As with #669, the BIDS-compliant anonymized date will still be written to `scans.tsv`; only the EDF file itself will be modified.

The PR also does a small internal refactor to allow both EDF and BDF writing; this is needed for #1129, because EMG modality will have BDF(+) as a RECOMMENDED format.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [ ] PR title starts with [MRG]
- [ ] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [ ] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd3c984f2f22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.