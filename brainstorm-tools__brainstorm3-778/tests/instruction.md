# Issue

**Title:** Bugfix: Panel Digitize

## Description

**Both panels:**
- [x] For 3D scanner, while manually collecting/correcting EEG points, enable `Random` button IFF all EEG points have been already collected/corrected. Check c177d50 2fc8adb
- [x] Right click on `texture > Digitize (3D scanner)`, get the correct subject ID from the subject name. Check 4b78658

**2024 panel:** 
- [x] For 3D scanner, after `Auto` detection, change delete button label and callback such that we can delete the last point. Check 3e0a5ae

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0aac8311fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.