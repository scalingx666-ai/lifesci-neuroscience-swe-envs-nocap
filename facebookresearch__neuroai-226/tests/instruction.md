# Issue

**Title:** neuralfetch: require moabb>=1.6.1 and drop the upstreamed workarounds

## Description

[MOABB 1.6.0](https://pypi.org/project/moabb/1.6.0/) is out, and it ships the three fixes `neuralfetch/studies/moabb2025.py` was patching around (). This raises the requirement and deletes the local copies — net **−194 lines**.

### What was removed, and why it is safe

| Removed | Upstream replacement |
|---|---|
| `Reichert2020Impact._load_raw` override | `bnci_2020.py` now does `bciexp.data.transpose(0, 2, 1).reshape(n_channels, -1)` itself |
| `_martinez_cagigal_convert_to_mne_format` + the lazy installer on `_MartinezCagigalCvepBase` | `resolve_cvep_command_ids(...)` + `add_stim_channel_trial(..., offset=200)` |
| `_patch_figshare_file_list_cache()` | process-level `lru_cache` on `fs_get_file_list` + on-disk MAMEM listing cache |

Each was checked against the moabb source at tag `v1.6.0` rather than against the changelog:

- **Reshape** — the override never read the existing buffer; it re-derived from the `.mat` and assigned. It was therefore idempotent, and upstream now produces the same array. `1e-6` scaling still happens in the same place (`bnci_2020.py`), and the `[…eeg…, HEOG, VEOG, STI]` row order is unchanged.
- **`stim_trial`** — upstream's train/test command-id derivation is element-for-element equivalent to the patch's (`np.unique(..., return_index=True)` yields first-occurrence indices in ascending order, matching the patch's `np.where(...)[0][0]` scan), and both use `offset=200`. Upstream also writes `command_id` into the `_trial_meta` annotation extras, so no metadata is lost; nothing outside this module reads it in any case.
- **Figshare** — upstream's cache uses the same `(article_id, version)` key with a larger `maxsize`. Keeping the local patch merely nested a second cache inside the upstream one and shadowed `fs_get_file_list.cache_clear()`.

One visible side effect: `stim_trial`'s channel *index* moves, because the patch used drop-and-re-add while upstream appends in order. Everything here selects it by name (`mne.find_events(raw, stim_channel="stim_trial")`), so nothing depends on the index.

### Test

`test_reichert2020_impact_eeg_layout` is kept unchanged. It asserts the invariant — `raw._data[c, t * n_samples + s] == bciexp.data[c, s, t] * 1e-6` — not the mechanism, so with the override gone it becomes a guard against an upstream regression. Only its docstring is updated to say so.

`ruff check` and `ruff format --check` are clean on `neuralfetch-repo`; `pytest neuralfetch/test_studies.py` gives 6 passed, 142 skipped (the skips need cluster data).

### ⚠️ Unrelated behaviour change in the same moabb release

Worth knowing before merging, though it is not caused by this PR. Separately from #1068,  converts `MartinezCagigal2023Checker` / `MartinezCagigal2023Pary` EEG **from microvolts to volts**:

```diff
- raw_data = mne.io.RawArray(signal.T, info, verbose=False)
+ # The BSON files store EEG in microvolts; convert to Volts for MNE.
+ raw_data = mne.io.RawArray(signal.T * 1e-6, info, verbose=False)
```

`martinezcagigal2023_checker_cvep.py:337` and `..._pary_cvep.py:368`. That commit is not an ancestor of `v1.5`, so 1.6.0 is the first release carrying it. This makes the units correct for MNE, but it is a real data change and nothing in `neuralfetch` compensates for it — the only `1e-6` in the module was the BNCI one being removed here. Any cached statistics, normalisation constants, or trained artifacts derived from those two studies under moabb 1.5 are on the old scale and should be regenerated.

### Lee2019 now exposes both sessions (behaviour change, handled here)

moabb 1.6.0 changed the Lee2019 session key from `str(session - 1)` to `str(session)` ([`Lee2019.py:222`](https://github.com/NeuroTechX/moabb/blob/v1.6.0/moabb/datasets/Lee2019.py#L222)) while `selected_sessions` stays `(1, 2)`, so the `get_data` filter at `base.py:880` keeps a different number of sessions:

| | session keys | kept by filter `{"1","2"}` |
|---|---|---|
| moabb 1.5 | `"0"`, `"1"` | one session — holding the **session-2** recording |
| moabb 1.6.0 | `"1"`, `"2"` | **both** |

`_download` emits one row per `(subject, session, run)` and the run layout is identical per session, so the count doubles exactly. `num_timelines` is updated accordingly: `Lee2019EegErp` 108 → 216, `Lee2019EegMi` 54 → 108, `Lee2019EegSsvep` 54 → 108. Without this, `Study._check` (`neuralset/events/study.py:607`) raises `Dataset ... is corrupted, expected 108 timelines but found 216`.

These counts are **derived** from the filter change rather than measured against a fresh download — worth confirming on a machine that has Lee2019 staged.

⚠️ **A stale `timelines.csv` does not error.** It is not tracked in git, so it persists per-installation. Session key `"1"` still resolves — but now returns the *session-1* recording where it previously returned *session-2*. Anyone with Lee2019 already downloaded should delete `timelines.csv` for these three studies so it is rebuilt, and invalidate artifacts derived from Lee2019 under 1.5.

Lee2019 is the only affected study here: it is the only wrapped dataset whose session keys changed. (`Liu2025` and `Nieto2022` also carry `_selected_sessions`, but neither is wrapped by neuralfetch.)

### Compatibility

All **83** moabb-backed studies in this module were checked by extracting `aliases[0]` via AST and intersecting with the dataset names moabb `v1.6.0` exports — none is missing. In particular `BCIComp2020IS`, which 1.6.0 removes, is not referenced anywhere in the repo.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a3edf060695`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.