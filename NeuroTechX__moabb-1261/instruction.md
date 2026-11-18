# Issue

**Title:** Document BNCI2015_003 single-character subjects (1:35 class ratio)

## Description

### Document BNCI2015_003 single-character subjects (1:35 class ratio) (#274)

Subjects 1 and 2 (s1.mat, s2.mat) were recorded with the single-character
speller: 36 flash codes with one target, 75 Target / 2625 NonTarget flashes
per run. Subjects 3-10 used the row/column speller (12 codes, two targets,
150 / 750 per run). Counts measured on the released files match the
loader's events and the P300 paradigm epochs one-to-one, so this is the
data, not event decoding; document it in the class docstring.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d1222420a52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.