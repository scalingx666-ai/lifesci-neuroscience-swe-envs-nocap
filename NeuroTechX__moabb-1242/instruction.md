# Issue

**Title:** Fix Beetl2021_A/B loading the 3-class final test labels with the 4-class map

## Description

.

`final_MI_label.txt` holds the BEETL final phase's **three-class** test labels. Class 2 is "other": right hand or feet for dataset A, feet or rest for dataset B. Both loaders read it with the four-class training map, so every "other" trial loaded as `right_hand` (A) or `feet` (B).

### Changes

- **Test-run map.** The final test run gets its own map. The merged class is a new event, `right_hand_or_feet` (A) or `feet_or_rest` (B), listed last in `event_id`. `LeftRightImagery` never selects it. Pass `events=` to pick the four training classes or the competition's three.
- **Leaderboard phase.** It now serves its training run only. Before, it attached slices of the final-phase label file to the leaderboard test trials, whose labels were never released.
- **Last trial.** `interval` now ends one sample before 4 s, as in Pan2023 and Pan2025. MNE includes `tmax`, so the last trial of every run was being dropped.
- **Units unchanged.** A's files are already in volts. B's are in µV and are still scaled by `1e-6`.

### On the real data (final phase)

| Subject | Test run before | Test run after | Trials before | Trials after |
|---|---|---|---|---|
| A, S1 | rest 50, left_hand 50, right_hand 99 | rest 50, left_hand 50, right_hand_or_feet 100 | 298 | 300 |
| B, S4 | left_hand 50, right_hand 50, feet 99 | left_hand 50, right_hand 50, feet_or_rest 100 | 318 | 320 |

### Tests

`moabb/tests/test_beetl2021_labels.py` adds synthetic tests that need no network. They cover the label maps, paradigm selection, the leaderboard phase and the trial count. `test_datasets.py`, `test_dataset_fixes.py` and `test_metadata.py` also pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7819d70e3b40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.