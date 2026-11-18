# Issue

**Title:** Fix label leakage in BNCI2025_001, the two montages gh-700 never shipped, and the NEMAR prefetch guard

## Description

Four dataset-level defects found while auditing what downstream consumers have to work around. The first one changes reported results.

## 🔴 `BNCI2025_001` feeds the labels to the classifier

`_load_data_001_2025` reads the EEGLAB file and never calls `set_channel_types`:

```python
raw = mne.io.read_raw_eeglab(str(set_file), preload=True, verbose=verbose)
```

The `.set` files carry seven non-EEG channels next to the montage — `x`, `y`, `vx`, `vy` (hand kinematics), `targetPosX`, `targetPoxY` (the reaching target) and `validity`. `read_raw_eeglab` types anything it cannot recognise as `eeg`, so:

- the declared montage has **60** electrodes, but `METADATA` claimed `n_channels=67` — the difference is exactly those 7
- `pick_channels_for_modalities` defaults to `mne.pick_types(info, eeg=True, stim=False)`, so **all 67 are picked as EEG**
- target position and hand velocity therefore reach the classifier as features, and they encode the direction and distance that *are* the 16 class labels

This is label leakage: any benchmark run on `BNCI2025_001` today is inflated. The sibling loader in the same module, `_convert_run_002_2025`, already builds an explicit `ch_types` list (`["eeg"]*60 + ["eog"]*4`), so this looks like an oversight rather than a decision.

**Results on this dataset will get worse, and that is the fix.** Cached BIDS artifacts for it should be invalidated, since channel types are part of the cached raw. Anyone who genuinely wants the kinematics can still ask via `return_all_modalities=True`, which becomes meaningful for this dataset instead of a no-op.

Metadata is corrected alongside: `n_channels=71` with `channel_types={"eeg": 60, "eog": 4, "misc": 7}`, which now sums correctly and matches what `test_n_channels_matches_raw_data` counts (all non-`stim` channels). `misc` in `channel_types` follows the existing precedent in `ssvep_kim2025.py`.

## 🟠 Two datasets never got the montage gh-700 announced

The changelog entry for gh-700 reads *"Fixing unit issue and lack of montage with … Rodrigues2017 … Cattan2019_PHMD …"* (five datasets in total). The commit changed exactly one line per file — `S` → `S * 1e-6`. For **`Cattan2019_PHMD`** and **`Rodrigues2017`** there is **no `set_montage` call anywhere** in their loaders (grep count: 0 in both), so the montage half was never implemented.

It could not have worked as written either. Both share the same 16-electrode setup and both spell the two frontal-central electrodes `Fc5`/`Fc6` — the **only two of their sixteen names** that `standard_1020` cannot resolve (`FC5`/`FC6` both do). Both are fixed here, in the channel lists and in the `METADATA` sensor lists, and the montage is applied with `on_missing="ignore"`, matching the house pattern in `bnci/utils.py::make_raw` and `stieger2021.py`.

`Rodrigues2017` additionally declared `montage="standard_1010"` in its `METADATA` — not a montage MNE can build (`make_standard_montage` rejects it), so it would raise for anyone who took it at face value. Corrected to `standard_1020`, which is what the 16 channels actually are.

I audited the rest of that gh-700 list: `Huebner2018`, `BaseCastillos2023` and `Ofner2017` do set a montage.

**`Cattan2019_VR` is the third copy** and is fixed too. All three are the same g.tec 16-electrode setup with the same `Fc5`/`Fc6` spelling. Fixing only two would have left MOABB shipping two spellings of one electrode: `channels=["FC5", "FC6", "Cz"]` would select on `Rodrigues2017`/`Cattan2019_PHMD` and trip the `len(picks) == len(self.channels)` assert on `Cattan2019_VR`, and a benchmark spanning them would lose both electrodes to the channel intersection — a worse state than the original consistent defect. Its montage is now set once on the shared `Info`, so the `if not ds.code == "Cattan2019-VR"` branch (which exists for VR block splitting) no longer doubles as the reason its Raws had no positions.

## 🟠 `Cattan2019_PHMD` annotates 60-second blocks as lasting 1 second

`interval=[0, 1]`, while the dataset's own metadata records `block_duration_s=60.0` and its methodology says *"Each block consisted of 1 minute of EEG recording"*. `SetRawAnnotations` derives annotation durations from `interval`, so every relaxation block was stamped 1 s long. Among the resting-state datasets this was the outlier — `alphawaves` uses `[0, 10]` for 10 s blocks, `hinss2021` `[0, 2]` for 2 s.

Backward compatibility, traced through every consumer of `dataset.interval`:

- `paradigms/base.py:627` uses `interval[0]`, unchanged at `0` → **annotation onsets do not move**
- `paradigms/base.py:629` uses `interval[1]` **only when `self.tmax is None`**; `RestingStateToP300Adapter` sets `tmax=50`, so its default path and the shipped example are unaffected
- `preprocessing.py:783` takes the stim-channel branch here, which ignores `interval`
- no test asserts this value

## 🟠 The NEMAR provider pin silently doesn't hold

`_prefetch_nemar_sourcedata` returned as soon as the store held *anything*:

```python
store = self._sourcedata_store()
if store is not None and store.is_dir() and any(store.iterdir()):
    return
```

But `SOURCEDATA_PROVENANCE = "sourcedata/sourcedata_provenance.json"` lands **inside** that store. So for a caller that loads one subject at a time — `get_data(subjects=[s])` in a loop, which is how corpus builders drive this — subject 1 prefetches, the store becomes non-empty, and **every subsequent subject skips the prefetch** and falls through to the upstream host via `data_dl`. With the provider pinned to `"nemar"` that silently breaks the guarantee the pin advertises. Worse, if the manifest downloads but the subject fetch fails, the store is non-empty forever and prefetch is permanently disabled for that dataset.

Each requested subject is now prefetched. `sourcedata_path` passes `force_update=False`, so `nemar.download(..., trust_existing=True)` does not re-transfer files already on disk — the cost is one listing call per subject rather than a re-download. That is the honest price of actually honouring the pin.

## Follow-ups filed, not fixed here

- **#1162** — `download-test.yml` collects nothing, so every `@pytest.mark.download` test runs in no CI job. `test_metadata_matches_raw_data` would have caught the `BNCI2025_001` leak below; it has never executed.
- **#1163** — 34 of 147 datasets have `n_channels != sum(channel_types) != len(sensors)`, and `validate_metadata_against_dataset` is exported but never called.
- **#1164** — 9 `METADATA.montage` values MNE cannot build, and 31 loaders declare a montage they never apply.
- **#1165** — `import moabb` mutates the caller's global matplotlib rcParams.

## Not included

An unrelated issue found in the same audit: `import moabb` mutates the caller's global matplotlib `rcParams` (`font.family` sans-serif→serif, `axes.grid` False→True, spines off), because `moabb/__init__.py` → `benchmark` → `moabb.analysis` → `analysis/plotting.py:39` calls `set_moabb_defaults()` at import time. Fixing it properly means moving that call out of import scope and into the plotting entry points, which is a behaviour change for anyone relying on `import moabb` styling their figures — so it does not belong in a bug-fix batch. Happy to open it separately.

## Split out

The `AcquisitionMetadata.n_channels` change that was here moved to #1166 — it touched 93 files mechanically and drowned these fixes in review. This PR is now 13 files.

## Version

The batch is bug fixes only, so the next release is a patch: `__version__` goes to `1.6.1dev0` and the open changelog section is renamed to match. The earlier `1.7.0dev0` assumed a minor release that this content does not justify.

## Verification

- `moabb/tests/test_metadata.py` + `moabb/tests/test_dataset_fixes.py`: 257 passed
- `pre-commit run` clean on all touched files
- `Cattan2019_PHMD` and `Rodrigues2017`: all 16 EEG channel names now resolve against `standard_1020`; `Cattan2019_PHMD.interval == [0, 60]`
- `BNCI2025_001`: `n_channels == sum(channel_types) == 71`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24ee544820b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.