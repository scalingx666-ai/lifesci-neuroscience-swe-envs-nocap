# Issue

**Title:** Thielen2021, Kaneshiro2015: no upstream request when the NEMAR store holds the files

## Description

Two loaders still contacted their upstream host although the NEMAR store held what they read:
- **Thielen2021**: the deposit (nm000214) keeps `offline/sub-NN/block_k/<file>`, four segments of the URL path, while the URL lookup of `data_dl` probed at most three, so every GDF and `trainlabels.mat` came from public.data.ru.nl. The lookup now probes four trailing segments (longest first, so a deeper match is never less specific).
- **Kaneshiro2015** took `S<n>.mat` from the store (nm000263) but then sent a `Range` request to stacks.stanford.edu on every load to detect truncated downloads. It is skipped for a file the size of the store copy (nemar-py verified it); files from elsewhere are still checked.

Not fixed here (NEMAR side, listed for the deposit owners): the shared `resources/` files of Thielen2021 (`mgold_61_6521_flip_balanced_20.mat`, `nt_cap8.loc`) and Thielen2015 (`biosemi64.loc`) are filed under the last subject (30 / 12) instead of `subject: null`, so other subjects' prefetch misses them and those two/one small files still come from public.data.ru.nl.

Tests: `test_nemar_store_lookup_depth.py` (fails on develop).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7f9fefd4850`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.