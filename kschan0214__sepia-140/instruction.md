# Issue

**Title:** Fix MEDI fallback percentage to match the GUI default

## Description

Hi Kwok, I noticed a small inconsistency in the MEDI wrapper’s fallback percentage.

When `algorParam.qsm.percentage` is omitted, the wrapper defaults to `0.9` and then divides it by 100 before calling `MEDI_L1`. Consequently, MEDI receives `0.009` instead of `0.9`, which can lead to excessive smoothing.

This one-line change sets the fallback to `90`, matching the GUI and documented default:
https://sepia-documentation.readthedocs.io/en/latest/method/qsm/MEDI.html#algorparam-qsm-percentage

Thanks to the team for maintaining SEPIA!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db939ccc1e9a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.