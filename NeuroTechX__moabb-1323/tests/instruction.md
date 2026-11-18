# Issue

**Title:** Fix BNCI2015_004 tasks and window, Wang2016 35 subjects, BNCI2014_002 DOI, and METADATA events of five datasets

## Description

## Summary

Four dataset definitions that the 2026 metadata enrichment (#868, #974) or an older declaration got wrong, found by diffing every dataset class between v1.4.3 and develop and checking each change against the datasets' own descriptions and papers (the ones the enrichment downloaded under `moabb_tmp_folder/papers/`). One commit per dataset; regression tests; whats_new.

### BNCI2015_004: tasks and window
#868 rewrote the events as `math/letter/rotation/count/baseline`, the five tasks of Keirn & Aunon (1989), another dataset, and the interval as `[0, 4]`. The BNCI description of 004-2015 says "1 equals WORD, 2 equals SUB, 3 equals NAV, 4 equals HAND and 5 equals FEET"; Scherer et al. 2015 (the cited paper) names the same five tasks; the trial timeline is cross at 0 s, cue at 3–4.25 s, imagery until 10 s. Every release through v1.2.0 had `right_hand=4, feet=5, navigation=3, subtraction=2, word_ass=1` and `[3, 10]`. Since v1.5, `MotorImagery` (and `LeftRightImagery`-style event filters) rejected the dataset, and the generic `imagery` paradigm epoched the fixation period under wrong names. The enrichment's own validation report had flagged the mismatch (two warnings, `experiment.events`). Restored, with the docstring.

### Wang2016: 35 subjects
The class has declared `subjects=list(range(1, 35))` (34) since its creation; the paper has 35 subjects and the Zenodo record 14865172 serves `S35.mat` (106 MB). Its docstring already said S01–S35. Now 35; `summary_ssvep.csv` updated.

### BNCI2014_002: DOI and reference
#868 set the DOI to `10.1007/s00500-012-0895-4`, which resolves to "Brain–computer interfacing: more than the sum of its parts" (Soft Computing 2012, a review). The dataset's paper is Steyrl, Scherer, Faller & Müller-Putz (2016), *Biomed. Tech.* 61(1), `10.1515/bmt-2014-0117`, as every release through v1.4.3 said. Restored.

### METADATA.experiment.events of BNCI2014_002/004/008/009 and BI2015b
The enrichment wrote the raw GDF codes (`769/770`; for BNCI2014_004 a table of every GDF event type), lower-case or hyphenated class names (`target/non-target`, `Non-Target`) and other codes than the ones the loaders assign. The BIDS/HED export, the docs and the catalog read `METADATA.experiment.events`, so they disagreed with `event_id`. Now equal.

### Tests
`moabb/tests/test_dataset_metadata_regressions.py`: no download; fails on develop, passes here.

## Also changed by the enrichment, not touched here (for the maintainers' review)
Cattan2019_PHMD `interval [0, 1] -> [0, 60]` and events `off/on` vs `switched-off/on`; Liu2024 `interval (2, 6) -> (0, 4)`; Kojima2024A/B, Ofner2017, Hinss2021: `METADATA.experiment.events` differ from `event_id`; Wang2016's `METADATA.experiment.events` is a trial timeline, not the 40 classes; BNCI2015_013, BNCI2016_002: class events differ from the catalog. Session declarations that moved from the minimum to the maximum per subject (BNCI2015_001 2→3, BI2013a 1→8, Cattan2019_VR 1→2, Huebner2017/2018 1→3, Sosulski2019 1→80) only describe; the loaders are unchanged. Nakanishi2015's 9→10 subjects (#868) is right (the paper has ten; the mirror serves s10.mat).

## Test plan
- [x] the new tests fail on develop and pass on this branch
- [x] BNCI2015_004 subject 1: 40 + 40 right-hand/feet trials per session in 7-s epochs; the five raw classes have 40 trials each
- [x] Wang2016 subject 35 and Nakanishi2015 subject 10 download and load (240 and 180 trials)
- [ ] CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51fec06d4125`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.