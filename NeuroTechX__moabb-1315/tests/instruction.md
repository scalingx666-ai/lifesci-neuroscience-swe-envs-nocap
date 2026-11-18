# Issue

**Title:** BI2013a: use the extracted runs from the NEMAR deposit before downloading the session ZIPs

## Description

Deposit nm000264 keeps `subject_NN/Session*/<run>.mat` + `meta.yml`, but `_bi_data_path` called `data_dl` on each session ZIP unconditionally (audit Phase B: 32 zenodo hits for subject 1).

Place the subject tree with `fill_tree_from_store` first and skip any session ZIP whose `SessionN` directory (or, for the single-ZIP subjects >7, the extracted `meta.yml`) is already present. Note the deposit is partial (only some runs), so subjects whose deposit copy is incomplete still fall through to the ZIPs — no behaviour change there.

Test: `moabb/tests/test_bi2013a_store.py` mocks the store, forbids sockets/`data_dl`; fails on develop, passes here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8b6d51e7a0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.