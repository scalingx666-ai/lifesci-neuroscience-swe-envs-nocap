# Issue

**Title:** Served-shape load checks; tp2 test on served shapes

## Description

mla.init_layer and bind_kv_cache refuse shapes the fused DSA layer can't take; test_tp2_matches_tp1 uses a hidden-512, page-8, fp8-KV model. tp=2 itself runs on the trn2 host.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66514221ebab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.