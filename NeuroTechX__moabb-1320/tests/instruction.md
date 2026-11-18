# Issue

**Title:** Seed NEMAR deposits for ten archive loaders (Chen2017, EPFLP300, Nguyen2017_V, Vagaja2023, Jeong2020, Stieger2021, Yi2025, Yang2025, Schrag2026, Brandl2020)

## Description

Phase B of the 2026-10-19 NEMAR sourcedata audit showed these loaders hitting their upstream host for every subject although their published NEMAR deposits already hold the extracted files under the correct provenance subject labels.

- `nemar_seed_cache = True` for Chen2017SingleFlicker (nm000122), EPFLP300 (nm000231), Nguyen2017_V (nm000261, joining its S/SL siblings), Vagaja2023 (nm000292), Jeong2020 (nm000311), Stieger2021 (nm000339), Yi2025 (nm000160), Yang2025 (nm000348), Schrag2026Pediatric (nm000334) and Brandl2020 (nm000329).
- EPFLP300 and Schrag2026Pediatric checked their cache only after calling `data_dl`; they now return the seeded subject tree first.
- Stieger2021 listed the Figshare article on every `data_path`; it now returns locally seeded `S<subject>_Session_*.mat` files without that call.
- GuttmannFlury2025's deposit nests subjects 5 and 9 one level deeper (`S05/S05/Sess01/...`, from extracting `S05.zip` into `S05/`), which is why only those two subjects still downloaded their ZIP; `_data_path_for_paradigm` now accepts that nested tree.

Tests: `moabb/tests/test_nemar_uncovered_loaders.py` builds a mocked NEMAR store per dataset (provenance + `upstream_cache_root` taken from the real deposits), seeds subject 1 (17 for Vagaja2023), forbids sockets and `data_dl`, and asserts `data_path` is served from the store; plus the double-nested GuttmannFlury2025_P300 case. Staged-store verification on Voyager with the real deposits is reported in the audit notes.

Yi2025/Yang2025 note: their Phase B 'errors' were the audit harness killing loads whose upstream ZIP (15 GB / 65 GB) pushed MNE_DATA past 40 GB, not loader failures; seeding avoids the archive entirely.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f17228ece809`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.