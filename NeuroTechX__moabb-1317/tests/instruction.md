# Issue

**Title:** Castillos2023: take the shared 4Class-CVEP tree from the NEMAR store before downloading the shared ZIP

## Description

All four Castillos classes called `data_dl` on the same 0.6 GB `4Class-CVEP.zip` for every subject (audit Phase B: 3 zenodo hits per class checked); each NEMAR deposit (nm000342/344/345/346) keeps its paradigm's members under the same `4Class-CVEP/` tree.

`data_path` now resolves the shared cache folder via `data_dl_destination` and fills the tree with `fill_tree_from_store` before downloading; the ZIP is fetched at most once.

Test: `moabb/tests/test_castillos_store.py` mocks the store (real inline-data .set), forbids sockets/data_dl; fails on develop, passes here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48f4458b4217`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.