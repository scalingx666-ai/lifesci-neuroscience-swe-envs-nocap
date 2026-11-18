# Issue

**Title:** FIX(metrics, optinorm): -s weighted, mad renamed medae, multi-pair keys, argv copy; -h help

## Description

Part of #171. These are the remaining `metrics` items found in #222, plus the `optinorm` help item found in #224. I reproduced each one first. This description has been updated after your review.

1. **`-s weighted` was silently ignored** for image metrics and hausdorff, because only `compute_label_metrics` handled it.
   - **hausdorff / hausdorff95** now compute a `weighted` value, weighted by reference label volume, as the overlap metrics do.
   - **Image metrics** keep their usual micro/macro averaging and get no `weighted` key. *(Changed after review:)* `-s weighted` no longer raises an error. If every requested metric is an image metric, a `UserWarning` says that `weighted` has no effect; mixed calls such as `-m dice mse -s weighted` run without a warning.
2. **`mad` was documented as "Median Absolute Deviation"**, but it computes median(|pred − ref|). *(Changed after review:)* it is renamed to **`medae`**: the Median Absolute Error (MedAE), as in scikit-learn's `median_absolute_error`. `mae` would have been wrong, because MAE means the *mean* absolute error.
   - `mad` still works as a deprecated alias. It emits a `FutureWarning` and stores its results under `medae`, as the `ssq` → `rms` deprecation in #197 does.
   - The `images` group now includes `medae`.
   - No mean absolute error metric is added.
3. **The parser changed the argument list passed to `_cli`.** The list is now copied first, so the test helper no longer needs its `list(args)` workaround.
4. **`optinorm` help** showed `-h, --help [LEVEL]`, copied from `register`, which has three help levels. `optinorm` has a single help text and its `-h` takes no value, so the help now reads `-h, --help`, as in `simplereg`.
5. **Several `-p`/`-r` pairs.** Image results were keyed `0, 1, …`, so different pairs written with `--append` overwrote each other.
   - *Decision:* when there are several pairs, each a single channel with a distinct prediction base name, image results are keyed by that base name (for example `pred`, `pred2`).
   - Unchanged: the `micro`/`macro` keys, the single-pair output (`'0'`), and the output file name.

**Docs:** a writer subagent updated `metrics.md`:
- `medae` and the `mad` alias;
- `-s weighted` with label and image metrics, and the warning;
- the multi-pair keys;
- in the Known issues, the fixed bullets are removed, and the caveat that is still true stays: label metrics pool all pairs.

It also updated the `-h` row in `optinorm.md`.

**Tests:**
- `test_weighted_hausdorff`;
- `test_weighted_image_metrics_warns`: image-only calls warn and have no `weighted` key; `dice mse` does not warn, dice is weighted, and mse is unchanged;
- `test_medae_wording` and `test_mad_deprecated_alias`: the warning, the `medae` key, the value against `torch.median`, and `-m mad medae` giving a single key;
- `test_args_not_mutated`, `test_multi_pair_keys` and `test_optinorm_help_matches_parser`.

`test_cli_metrics.py` gives 18 passed. `pytest -k "metric or cli"` gives 800 passed and 10 skipped.

**New bugs noticed, not fixed (added to #171):**
- With several pairs, label metrics compare `pred == label` over the whole stacked volume, so there are no per-pair label results.
- `hausdorff` on stacked or 4D inputs probably treats the channel axis as a spatial axis.
- A label missing from the prediction gets a hausdorff distance of 0 instead of inf or NaN, which flatters the averages.
- The `meanspace` and `affreg` help also show `-h, --help [LEVEL]`; this is not yet checked against their parsers.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa6vBGMPWQMVRQtfkuf

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3d67c68fa25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.