# Issue

**Title:** Update h5io version for CVE

## Description

Bump to h5io 0.2.6 which just came out because <= 0.2.5 is a [security risk](https://github.com/h5io/h5io/security/advisories/GHSA-vwvw-f6v4-w737), and thus takes priority over our SPEC0 standard.

I also enabled private vulnerability reporting in https://github.com/mne-tools/mne-python/settings/security_analysis so people can report that way instead of emailing if they want.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `379cfabd03db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.