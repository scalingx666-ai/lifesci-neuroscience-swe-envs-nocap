# Issue

**Title:** Count a subject's trials and sessions once in the dataset summary tables and the dataset bubble plots

## Description

`#Trials / class` in `moabb/datasets/summary_*.csv` is the number of trials of one subject per class over all of that
subject's sessions and runs. That is what the docs define ("the number of repetitions performed by one subject for each
class"), what `scripts/generating_metainfo.py` measures (all sessions of subject 1), and what most rows hold. Several
places did not follow it:

- `get_bubble_size` multiplied `_compute_n_trials` by `#Sessions`, so `dataset_bubble_plot`, `plot_datasets_grid` and
  `plot_datasets_cluster` drew BNCI2014_004 with 3,600 trials per subject instead of 720, EPFLP300 with 13,216
  instead of 3,304 and Sosulski2019 with 720,000 instead of 5,400.
- `generating_metainfo.py` wrote `Total_trials = #Sessions x #Runs x (subject 1's trials over all sessions) x #Subj`,
  e.g. 62,208 instead of 5,184 for BNCI2014_001.
- Some rows gave the trials of one run or one session (Huebner2017 and Huebner2018: 364 NT / 112 T instead of
  9,826 NT / 3,024 T and 10,920 NT / 3,360 T; Ofner2017, Zhou2020, Dreyer2023), or those of the largest subject
  (BI2013a, BI2014a, BI2015a, Sosulski2019).
- The plots read the first integer of `#Sessions`, so BI2013a's "8 for subjects 1-7 else 1" gave 8 sessions to every
  subject.

Changes
- `get_bubble_size` no longer multiplies by `n_sessions` (signature unchanged). The bubble is the trials of one
  subject; the sessions only set the transparency, as documented. The docstrings of `_compute_n_trials`,
  `dataset_bubble_plot` and `plot_datasets_grid/cluster` say "per subject" (API-changes entry in whats_new).
- `generating_metainfo.py`: `Total_trials = trials of a subject x #Subj`, column names aligned with the CSVs.
- Rows checked on every subject against what MOABB's paradigms return (benchmark rerun: within-session result rows for
  MI and SSVEP, `P300().get_data` epoch and class counts per session for P300):
  - MI: BNCI2014_001, BNCI2014_002, BNCI2014_004, BNCI2015_001, Cho2017 (52 subjects), Lee2019_MI, PhysionetMI,
    Schirrmeister2017 (120 -> 260 per class), Shin2017A, Weibo2014, Zhou2016.
  - SSVEP: MAMEM1 ("12-15" -> 23), MAMEM2 and MAMEM3 ("20-30" -> 25).
  - P300: BI2013a, BI2014a, BI2015a and Sosulski2019 (now the median subject), Cattan2019_VR (both sessions),
    Huebner2017 and Huebner2018 (all three sessions).
  - Already right: AlexMI, GrosseWentrup2009, Kalunga2016, Lee2019_SSVEP, Nakanishi2015, Wang2016, BI2012, BI2014b,
    BI2015b, BNCI2014_008, BNCI2014_009, BNCI2015_003, EPFLP300, Lee2019_ERP.
- Rows that follow the counts their loader documents (docstring, `METADATA`, default parameters):
  - a per-session or per-run `#Trials / class`: BCIComp2020UpperLimb, Brandl2020, Dreyer2023 (A, B, C), Gao2026,
    GuttmannFlury2025_MI/ME/SSVEP, HefmiIch2025, Jeong2020, Ofner2017, Tavakolan2017, Wang2026Handwriting, Yang2025,
    Zhou2020, Zuo2025;
  - `Total_trials`: BNCI2015_004, Kaneshiro2015, Liu2025 (its loader returns the "pre" session only), Shin2017B;
  - `#Classes`: Yang2025 and Wang2026Handwriting list the 2 and 11 classes their loaders return by default.
- `#Sessions`: when subjects differ, the cell starts with the sessions of the median subject, which is the integer the
  plots read. BI2013a is now "1 (8 for subjects 1-7)", Sosulski2019 "60 (80 for subject 1)", BNCI2015_001
  "2 (3 for subjects 8-11)"; Gao2026, GuttmannFlury2025_*, Kaya2018, Liu2025, Ortiz2023, Peters2026, RomaniBF2025ERP
  and Thapa2025 change the same way.
- `dataset_summary.rst` states both conventions.
- New `moabb/tests/test_summary_trials.py`:
  - 34 verified per-subject trial and session counts, checked against `_compute_n_trials`, the bubble size and the
    first integer of `#Sessions`;
  - the bubble size does not depend on the sessions;
  - `Total_trials` is within [0.8, 1.25] of `#Subj x #Classes x #Trials / class` for the imagery, cognitive and
    imagined-speech tables.
  Five rows are still inconsistent and have no documented per-subject count: Stieger2021, BNCI2003_004, BNCI2020_001,
  Beetl2021_A and Kaya2018. They are listed in `UNVERIFIED_TOTAL_TRIALS`, and the test fails if a listed row becomes
  consistent, so the list cannot go stale.

Tests: the new test, `test_plotting.py`, `test_analysis.py`, `test_chance_level.py`, `test_timeline.py`,
`test_metadata.py` and `test_datasets.py -k summary` pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed1aacdb39a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.