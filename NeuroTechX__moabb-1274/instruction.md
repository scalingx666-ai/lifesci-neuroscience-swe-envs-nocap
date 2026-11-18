# Issue

**Title:** Add Peters2026 (BCI-FIT, OpenNeuro ds007720): longitudinal P300 calibration dataset (ALS cohort)

## Description

.

Adds `moabb.datasets.Peters2026`, a loader for the Matrix and RSVP calibration runs of BCI-FIT (Peters et al., OHSU; OpenNeuro `ds007720`, CC0; NEMAR mirror `on007720`). It covers five participants with ALS over 40 visits (6-10 each): 88 runs and 66,150 flashes (4,109 Target / 62,041 NonTarget), recorded with dry Wearable Sensing caps at 300 Hz. @qinxwew, this follows your proposal and the design in the issue; could you review it? Some points changed once I looked at the files, see "Deviations" below.

### Loader
- `BaseBIDSDataset` + `OpenNeuroMirrorMixin`, like the other OpenNeuro loaders. It tries NEMAR first (filtered to `task=[MatrixCalibration, RSVPCalibration]`, so about 0.9 GB of the 2.3 GB release is fetched) and falls back to per-file OpenNeuro S3 using a fixed inventory of the 88 calibration runs. All `cap` variants share one download folder.
- **Events:** `events.tsv` lists every flash twice at the same sample, once as `target`/`nontarget` and once with the presented character. The numeric `value` codes are assigned per file (target is 16/24/29/30/32/34 depending on the run), so labels come from `trial_type`. Inquiry-preview and key-press rows are dropped. The files have no prompt or cue rows. `get_additional_metadata` returns the presented character, layout, task, BIDS run and cap for each flash.
- **Sessions and runs:** one session per visit (`"0"` = `ses-1`). Runs are named `"<k>matrix"` / `"<k>rsvp"` in BIDS run order.
- **CopyPhrase** runs are not loaded (they are closed loop) and the docstring says so.
- Interval [0, 0.8] s. Template 10-20 montage. A2 (the ear electrode recorded by the DSI-24) is typed `misc`.

### Deviations from the design in the issue
1. **Run names are `0matrix` / `1rsvp`, not `matrix_0` / `rsvp_0`.** MOABB requires run keys to match `<index><label>` with a unique index per session (`check_run_names`), so `matrix_0` is rejected and `0matrix` + `0rsvp` collide. The layout is still the run-name suffix (`meta.run.str.endswith("rsvp")`).
2. **Two participants switched caps between visits.** `sub-P1` used the DSI-Flex at visit 1 and the DSI-24 afterwards; `sub-P2` used the DSI-Flex at visits 1-7 and the DSI-24 at visits 8-10 (from `CapManufacturersModelName`, consistent with `participants.tsv`). The files name the DSI-Flex channels **Cz**, Oz, P3, P4, PO7, PO8, Pz, while the README lists FCz. I keep **Cz** (see "Cz or FCz" below), so the caps share **Cz, P3, Pz, P4**, not Pz/P3/P4.
3. **One channel set per dataset variant, not per subject.** `WithinSessionEvaluation` (all evaluations, through `_prepare_parallel_dataset`) loads every subject into one array. My first version kept a per-subject channel set and failed on real data with `np.concatenate ... size 4 vs 19`. So the variants are:
   - default (`Peters2026`): all 40 visits, Cz/P3/Pz/P4;
   - `cap="DSI-24"` (`Peters-dsi24-2026`): 32 visits, all 5 subjects, 19 channels;
   - `cap="DSI-Flex"` (`Peters-dsiflex-2026`): 8 visits of P1/P2, 7 channels.

   Each variant has its own code, so caches and results stay apart. The codes pass `is_camel_kebab_case` and `is_abbrev("Peters2026", code)`; `is_abbrev` needs the code to end in the year, hence the `Ma-edf2022` style for the variants.
4. **DOI:** `10.18112/openneuro.ds007720.v1.0.1` returns 404 at doi.org. OpenNeuro has registered only `...v1.0.0`, and per `CHANGES`, 1.0.1 changed text only. The loader cites v1.0.0, and the README's requested poster citation is in the references. OpenNeuro (`10.18112/`) is added to `_DATA_REPO_PREFIXES` in `test_doi_validation.py`: DataCite returns its authors as `literal` names, which the resolver stores as empty strings, so the senior-author check cannot work on it.
5. **Files are unfiltered at 300 Hz.** The README's "downsampled to 150 Hz, 1-20 Hz + 60 Hz notch" is not what is distributed. The sidecars have `SoftwareFilters: n/a`, and on the real data the median 59-61 / 55-58 Hz power ratio is 24 and the median 30-50 / 5-15 Hz ratio is 0.11.
6. **Class name `Peters2026`, not `BCIFIT`** (maintainer decision): first author + year. BCI-FIT stays the dataset's name in the docstring.

### Cz or FCz on the DSI-Flex
I keep **Cz**, with moderate-to-high confidence (about 80%). The evidence is documentary; the signals could not separate the two positions.
- **The README contradicts itself.** It lists the DSI-Flex channels as "FCz, Pz, Oz, P3, P4, PO7, and PO8" and also says "the ground electrode was located at FCz on the DSI-Flex". The ground cannot also be a recording site.
- **Every metadata source in the release says Cz.** The `.vhdr`, `channels.tsv` and `electrodes.tsv` files all name the channel Cz. `electrodes.tsv` holds template positions, and the DSI-Flex "Cz" has exactly the same coordinates as DSI-24 Cz. The 67 DSI-Flex `*_eeg.json` files say `"EEGGround": "FCz"`; the DSI-24 files say `FPz`. The release has no `sourcedata` and no BciPy parameter files.
- **BciPy says Cz too.** BciPy is the authors' acquisition and BIDS-conversion software. Its `bcipy/parameters/devices.json` (since 2.0.0rc4, Nov 2024; unchanged in 2.0.0) defines the DSI-Flex with the first sensor labelled `Cz`, then Oz, P4, P3, PO8, Pz, PO7. That is the exact channel order of the released files. `bcipy/io/convert.py` keeps only channels whose names are in `get_1020_channels()`, and that list has no FCz. A channel recorded as FCz would therefore have been dropped, not renamed to Cz.
- **Wearable Sensing allows a non-default ground.** The DSI-Flex has "up to 7 custom sensor locations" with "Reference / Ground: Common Mode Follower / Custom". The DSI-7-Flex spec sheet gives Fpz as the default ground, so a custom cap with the ground at FCz is plausible. The vendor documentation does not fix any sensor at FCz.
- **The signals do not separate the two positions.** For P1 and P2, I compared the DSI-Flex "Cz" with DSI-24 Cz, an FCz estimate ((Fz+Cz)/2 and a spherical-spline interpolation) and Fz. The comparison used Matrix runs at 237 ms SOA. Each channel's target-minus-nontarget P300 and its 1-30 Hz band powers were taken relative to Pz of the same recording.
  - **P1:** the single DSI-Flex visit has almost no P300. Its slope relative to Pz is 1.0-1.1, against 1.37 ± 0.65 for DSI-24 Cz and 2.0-2.35 for the FCz estimates.
  - **P2:** the seven DSI-Flex visits range from -0.7 to 2.8. DSI-24 Cz behaves erratically in P2's visits 8-10 (0.12 ± 0.67).
  - **Both:** across visits, the ratios vary more than the expected Cz/FCz difference. The P300 is frontal-maximal and large in P1's DSI-24 visits (Fz 65 µV), which suggests an ocular contribution.

### Late RSVP P300: a real latency difference, not a trigger offset
The timing is unchanged; the docstring explains why.
- **Code and sidecars.** `events.tsv` has only `onset, duration (0.5 = BciPy label_duration), trial_type, value, sample`. There is no offset or photodiode column, and the recordings have no trigger channel (BciPy's conversion drops TRG). Both BciPy displays timestamp a flash with `window.callOnFlip(...)` and the experiment clock: `rsvp/display.py` uses `TriggerCallback`, `matrix/display.py` uses `add_timing`. `convert_to_bids` then applies one per-device `static_offset` (0.1 s for both DSI caps) to all triggers, whatever the layout.
- **Signals, in the 16 visits that have both layouts:**
  - **P300:** the Pz target-minus-nontarget wave is delayed in RSVP in **16/16** visits. The cross-correlation delay is 50-327 ms, median **92 ms**.
  - **Steady-state flash response:** in the 13 visits with RSVP at 203 ms and Matrix at 237 ms SOA, the apparent latency at occipital sites (phase of the flash-rate fundamental relative to the triggers) is the same in both layouts. The median RSVP-Matrix difference is **7 ms** (bootstrap 95% CI -19 to 16 ms; Wilcoxon against 0, p = 0.89). The difference between the P300 delay and this one is p = 0.0002.
  - **First flash of each inquiry:** the occipital P1 peak differs by a median of 3 ms. These are noisy, with 33-55 trials per run.

  A trigger offset would delay the early visual response and the P300 by the same amount; only the P300 is delayed. The delay also varies from visit to visit, which a fixed offset would not do.
- **Literature.** In Won et al. 2022 (*Sci Data* 9:388), the same participants had a later P300 in RSVP than in the matrix speller (315 ± 85 vs 262 ± 43 ms).

### Real-data verification (Voyager Kubernetes Jobs, full download)
- **Coverage:** all 5 subjects, 40 sessions, 88 runs. NEMAR download in 67 s (0.86 GB, 706 files); upstream S3 fallback also exercised for all subjects.
- **Event counts:** per run, the loader's Target/NonTarget counts match an independent parse of every `events.tsv`: 88/88 runs, 4,109 T / 62,041 NT. Most runs have 55 inquiries × 14 flashes (770 flashes, 50 T / 720 NT, 5 inquiries without a target). The release also has:
  - customized runs: 28 flashes per inquiry (5 runs of P2) and inquiry preview with a switch press (8 runs);
  - stimulus onset asynchrony from 83 to 337 ms;
  - 7 runs that end early (1-33 inquiries).
- **Epochs:** `P300().get_data` returns one epoch per flash, with no drops: P1 13,874, P2 19,936, P3 13,930, P4 9,156, P5 9,254 (shape `(n, 4, 241)`). `additional_metadata="all"` aligns 1:1 with the epochs. `cap="DSI-24"` gives `(12334, 19, 241)` for P1 and `cap="DSI-Flex"` gives `(1540, 7, 241)`.
- **P300 sanity:** mean Target − NonTarget at Pz over 250-500 ms (P300 paradigm, 1-24 Hz).
  - **Matrix runs:** positive in 33/40 sessions, median +0.84 µV.
  - **RSVP runs:** negative in 14/16 sessions in that window. Their difference wave has an earlier negativity and a later positive peak, at 456-713 ms against 380-450 ms for Matrix.
  - **All sessions pooled:** 27/40 sessions positive at 250-500 ms, 33/40 at 300-600 ms.
  - **Within-run classification:** RSVP AUC is 0.73, the same as Matrix at 0.74. So I read the RSVP result as later P3 latency, not wrong labels.
- **Within-session ROC-AUC:** `WithinSessionEvaluation` with XdawnCovariances(2) + TangentSpace + LDA:
  - default, 4 channels, 40 sessions: mean 0.735, median 0.731, range 0.505-0.979; 29/40 above 0.6. P2 and P4 are the weak subjects, at 0.51-0.69.
  - `cap="DSI-24"`, 19 channels, 32 sessions: mean 0.809, median 0.861, range 0.532-0.989.
- **Units:** the P300 differences are 0.5-8 µV. Raw median |x| is 18-1,140 µV because the data are unfiltered dry-electrode recordings with DC drift (hardware high-pass at 0.003 Hz).

### Tests
- `moabb/tests/test_peters2026.py` runs offline, without downloads. It uses a synthetic BrainVision BIDS tree with the release's quirks (per-file `value` codes, duplicate character rows, preview/key-press rows, first flash at sample 0 and last epoch ending on the last sample). It covers:
  - session and run naming;
  - Target/NonTarget counts and samples;
  - the mixed-cap channel policy;
  - concatenating a DSI-24-only subject with a cap-switching subject through `P300().get_data`, which is the regression for deviation 3;
  - the `cap` variants;
  - additional metadata;
  - a missing-run error;
  - the release inventory;
  - S3 fallback and NEMAR transport, mocked;
  - one code per `cap` variant that passes MOABB's naming checks.
- After the rename, I ran `test_peters2026.py`, `test_datasets.py`, `test_metadata.py`, `test_doi_validation.py`, `test_openneuro_mirror.py`, `test_loader_utils.py`, `test_download.py` and `test_paradigms.py` with `-m "not network and not download"` in a Voyager Job: **3185 passed**, 657 skipped, 799 deselected, 0 failed. The job ran on `ad8f10038`, which differs from the pushed head only in docstring and changelog wording. A real-data rerun of `Peters2026` on all subjects gave identical epoch counts (P1 13,874 ... P5 9,254; T/NT unchanged) and cap shapes. Within-session AUC: mean 0.732 for the default, 0.804 for `cap="DSI-24"`. `test_peters2026.py` (13 tests) also passes locally.
- Registration: `datasets/__init__.py`, `summary_p300.csv` (force-added), `api.rst`, `whats_new.rst` (proposal credited to @qinxwew), `doi_cache.json` (+2), catalog count 205 → 206.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bdc46633c58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.