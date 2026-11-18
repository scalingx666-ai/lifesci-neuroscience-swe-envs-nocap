# Issue

**Title:** Enable nemar_seed_cache for 10 loaders whose deposits are now complete (+ IMUMIA2026 subject selection)

## Description

Today's NEMAR releases completed these deposits for every subject: BrainVision `.eeg`/`.vmrk` added beside the headers, Curry `.cdt.dpa`/`.ceo`, the MAMEM figshare file lists and the Kojima Dataverse exports. This turns on #1290's opt-in `nemar_seed_cache` for the loaders whose new release is live on data.nemar.org and complete for all subjects:

NETBCI2026 (nm000305 v1.0.1), NeBULA2025 (nm000322 v1.0.1), Kodera2023 (nm000295 v1.0.1), IMUMIA2026 (nm000316 v1.0.1), MAMEM1/2/3 (nm000119/120/121 v1.0.4), Kojima2024A/B (nm000193/207 v1.0.6), Thapa2025 (nm000324 v1.0.1, needs the `.vhdr` fix PR).

How completeness was checked (metadata only):
- every loader subject has files in the latest `sourcedata_provenance.json`;
- no header lacks its companions;
- the files match the upstream archive listing (ZIP central directory) or the figshare list, apart from files the loaders never read.

**IMUMIA2026** also needed a loader fix. `data_path` took the n-th `.cdt` of the sorted task folder, which is right only when all five participants are on disk. With a cache seeded one subject at a time, subject 3 got another participant's file or a `FileNotFoundError`. It now matches the two-digit position field of the file name.

Not enabled here:
- **Already NEMAR-only without seeding:** BNCI2025_001, GrosseWentrup2009, PardoGarcia2026, BCIComp2020UpperLimb, Wang2025.
- **NEMAR-only through the extracted-files PR instead:** Huebner2017/2018, Liu2024, Sosulski2019.
- **Kueper2024:** the deposit files two subjects under the wrong labels ("70"/"27" for subjects 4/8).
- **BI2013a:** the deposit holds only the runs the default selection reads, and the loader is archive-first.
- **BCIComp2020WalkingERP:** v1.0.5 is not live yet.

Tests: `test_completed_deposits_seed_where_the_loader_reads` covers the ten loaders. Each case uses the deposit's real `upstream_cache_root` and checks that the seeded file lands where the loader reads it; all ten fail without the flags. `test_imumia2026_selects_by_subject_position_not_rank` fails on develop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7cb8d50ce2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.