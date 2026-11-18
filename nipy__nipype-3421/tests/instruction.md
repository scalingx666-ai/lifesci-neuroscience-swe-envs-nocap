# Issue

**Title:** [ENH]  Enable BidsDataGrabber to load saved layouts

## Description

A new input `load_layout` enables the `BIDSDataGrabber` to read a previously saved BIDSLayout. This makes the use of BidsDatagrabber much faster, since it doesn't need to reinterpret all Bidsfiles every time. 

Layouts can be saved via `layout.save(<path>)`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e31573baa9d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.