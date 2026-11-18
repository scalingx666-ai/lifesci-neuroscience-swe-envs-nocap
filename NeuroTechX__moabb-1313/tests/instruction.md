# Issue

**Title:** Tavakolan2017, Liu2025, Zhou2020, Wu2020: use the extracted subject from the NEMAR store before downloading the per-subject ZIP

## Description

NEMAR deposits nm000151/nm000270/nm000237/nm000142 keep the extracted per-subject tree, but these loaders only ever called `download_and_extract_subject_zip` on the Zenodo archive, so the store was never used and each subject cost 1-4.4 GB upstream (W42 sourcedata audit, Phase B: Tavakolan 6/6, Liu2025 3/3, Zhou2020 1/1, Wu2020 5/5 subjects hit zenodo.org).

Each `data_path` now tries `dl.fill_tree_from_store(data_dir, <subject dir>)` (all-or-nothing, refuses header-only recordings) before downloading, same pattern as #1293/#1300.

Test: `moabb/tests/test_nemar_store_subject_zips.py` mocks the store, forbids sockets and `data_dl`; fails on develop (data_dl called), passes on this branch (4/4). Voyager real-data check to follow in PR comment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c42a068a6599`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.