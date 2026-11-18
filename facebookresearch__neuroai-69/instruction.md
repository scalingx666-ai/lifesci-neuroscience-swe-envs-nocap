# Issue

**Title:** Switch Excel engine from openpyxl to calamine (~6× faster) in Nieuwland and Chen studies

## Description

This PR replaces the default openpyxl engine with calamine for `pd.read_excel` calls in `Nieuwland2018Large._preproc_stimuli` and `Chen2023Large._stimulus_info`, and merges Nieuwland's two separate sheet reads into one call (one file open instead of two). Also fixes a pre-existing typo in `Chen2023Large.requirements`: `"openxl"` → `"python-calamine"`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06a4d37400c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.